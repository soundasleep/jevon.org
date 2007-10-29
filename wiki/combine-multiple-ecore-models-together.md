---
layout: page
title:  "Combine Multiple Ecore Models Together"
author: jevon
date:   2007-10-30 10:27:50 +1300
---

Here is a quick script that can be used to combine multiple [[EMF]] [[Ecore]] models together into one super model. This uses the [[PHP]] scripting language, because this was easy!

This could be useful when developing models visually, as this allows you to work on multiple independent models at once. Each successively loaded '''.ecore''' file will be merged with the file before it, retaining information such as packages, classifiers and structural features.

To execute, use it on a command line like so:
[code]php -f combine.php model1.ecore model2.ecore model3.ecore > combined.ecore[/code]

In the future this will most likely go onto a public repository somewhere. <a href="mailto:support@jevon.org">E-mail me</a> if you have any suggestions.

[code]<?php

$model = false;

if (count($argv) <= 1) {
	fprintf(STDERR, "combine.php: Combine multiple EMF Ecore models together.

USAGE: php -f combine.php [file1.ecore] [...] > [output.ecore]
");
	exit(1);
}

$in_file_count = 0;
foreach ($argv as $i => $in_file) {
	if ($i != 0) {
		if (!file_exists($in_file)) {
			fprintf(STDERR, "File $in_file does not exist.");
			exit(1);
		}
		fprintf(STDERR, "Loading file $in_file...\n");	
		$xml = new SimpleXMLElement(file_get_contents($in_file));

		// get a new model
		$new_model = new EPackage();
		$new_model->node = $xml;
		constructModel($new_model, $xml);
		
		if ($i > 1) {
			// merge
			fprintf(STDERR, "Merging file $in_file...\n");
			$model->merge($new_model);
			
		} else {
			// set our old model to this new model
			$model = $new_model;
		}
		$in_file_count++;
		
	}
}

fprintf(STDERR, "Compiling new ecore model...\n");

echo $model->toXml();

function etypes() {
	return array(
		'eClassifiers' => 'EClassifier',
		'eStructuralFeatures' => 'EStructuralFeature',
		'eSubpackages' => 'ESubPackage',
		'eAnnotations' => 'EAnnotation',
		'eOperations' => 'EOperation',
		'eLiterals' => 'ELiteral',
		'details' => 'EDetails',
	);
}

function constructModel($model, $xml, $indent = 0) {
	foreach ($xml->children() as $child) {
		$obj = false;
		// echo str_repeat("--", $indent) . $child->getName() . "\n";
		
		$found = false;
		foreach (etypes() as $key => $value) {
			if ($child->getName() == $key) {
				$obj = new $value();
				$obj->node = $child;
				$model->addEType($key, $obj);
				$found = true;
				break;
			}
		}
		
		if (!$found) {
			fprintf(STDERR, "WARNING: Could not find any class for " . $child->getName() . "\n");
		}
		
		if ($obj) {
			constructModel($obj, $child, $indent + 1);
		}
	}
}

abstract class ArrayImploder {
	var $node;
	function implodeArray($a, $sep = ",") {
		$s = array();
		foreach ($a as $v) {
			$s[] = "$v";
		}
		return implode($sep, $s);
	}
	function getName() {
		$a = $this->node->attributes();
		return "" . $a["name"];
	}

}
abstract class EThing extends ArrayImploder {
	var $children = array();
	
	function __construct() {
		foreach (etypes() as $key => $value) {
			$this->children[$key] = array();
		}
	}

	function __toString() {
		$name = $this->getName();
		$s = $this->getThingName() . "[$name]";
		foreach (etypes() as $key => $value) {
			if ($this->$key)
				$s .= "($value=" . $this->implodeArray($this->$key) . ")";
		}
		return $s;
	}

	function getThingName() { return get_class($this); }
	abstract function getChildName();
	
	function addAttribute($key, $value) {
		// echo "$this : merge($key, $value)\n";
		// does it already exist?
		foreach ($this->node->attributes() as $ak => $av) {
			if ($ak == $key)
				return false;
		}
		$this->node->addAttribute($ak, $av);
		return $ak;
	}
	
	// merges $c into $this
	function merge(EThing $c) {
		// echo "$this : merge($c)\n";
		// replace attributes from $c to $this
		foreach ($c->node->attributes() as $key => $value) {
			$this->addAttribute($key, $value);
		}
		foreach (etypes() as $key => $value) {
			foreach ($c->children[$key] as $s) {
				if ($existing = $this->hasEType($key, $s)) {
					$existing->merge($s);
				} else {
					$this->addETypeCopy($key, $s);
				}
			}
		}
	}

	function checkParamType($key, EThing $obj) {
		$values = etypes();
		$class_name = $values[$key];
		if (!($obj instanceof $class_name))
			die("Parameter \$obj ($obj) is not of type $class_name");
	}
	
	function hasEType($key, EThing $c) {
		$this->checkParamType($key, $c);
		foreach ($this->children[$key] as $my_c) {
			if ($my_c->getName() == $c->getName()) {
				return $my_c;
			}
		}
		return false;
	}

	
	// add an EThing to this EThing
	function addFullChild(EThing $child) {
		return $this->addFullChild_recursive($this->node, $child);
	}
	
	// just recurse through $child's children as well
	function addFullChild_recursive(SimpleXMLElement $node, EThing $child) {
		// echo "$this : addFullChild(node, $child)\n"; 
		$new = $node->addChild($child->getChildName(), $child->node);
		//echo ">> added node " . $child->getChildName() . "\n";
		// add all the attributes
		foreach ($child->node->attributes() as $key => $value) {
			$new->addAttribute($key, $value);
			//echo " attr($key = $value), \n";
		}
		
		// add all the NS attributes
		foreach ($child->node->getDocNamespaces() as $ns_key => $ns_uri) {
			foreach ($child->node->attributes($ns_uri) as $key => $value) {
				$new->addAttribute($key, $value, $ns_uri);
				//echo " attr($ns_key:$key = $value), \n";
			}
		}
		
		// children of this child
		foreach (etypes() as $key => $value) {
			foreach ($child->children[$key] as $c) {
				$this->addFullChild_recursive($new, $c);			
			}
		}
		
		return $new;
	}

	function addEType($key, EThing $e) {
		$this->checkParamType($key, $e);
		$this->children[$key][] = $e;
	}
	function addETypeCopy($key, $e) {
		$this->checkParamType($key, $e);
		$this->children[$key][] = $e;
		$this->addFullChild($e);
	}
	
}
class EClassifier extends EThing {
	function getChildName() { return "eClassifiers"; }
}
class EStructuralFeature extends EThing {
	function getChildName() { return "eStructuralFeatures"; }
}
class ESubPackage extends EThing {
	function getChildName() { return "eSubpackages"; }
}
class EAnnotation extends EThing {
	function getChildName() { return "eAnnotations"; }
}
class EOperation extends EThing {
	function getChildName() { return "eOperations"; }
}
class ELiteral extends EThing {
	function getChildName() { return "eLiterals"; }
}
class EDetails extends EThing {
	function getChildName() { return "details"; }
}

class EPackage extends EThing {
	var $name;

	function getThingName() { die("EPackage::getThingName should never be called"); }
	function getChildName() { die("EPackage::getChildName should never be called");  }
	function __toString() { return "[root]"; }
	
	function toXml() {
		return $this->node->asXml();
	}
}[/code]

[[Category:Research]]
[[Category:EMF]]
[[Category:Todo]]
[[Category:Published Code]]
[[Category:PHP]]