---
layout: page
title:  "Comparing Two SimpleXML Documents"
author: jevon
date:   2008-09-23 09:29:15 +1200
---

[[Articles]] > [[PHP]]

As far as I know, there's no simple way to compare two <a href="http://nz.php.net/manual/en/ref.simplexml.php">SimpleXML</a> documents for equality. This fails:

[code]$xml1 = new SimpleXMLElement(file_get_contents('file1.xml'));
$xml2 = new SimpleXMLElement(file_get_contents('file2.xml'));
return $xml1 == $xml2;[/code]

And this might too, because whitespace around the tags or swapped attribute order might screw around with the text output:

[code]return $xml1->asXml() == $xml2->asXml();[/code]

Technically, even if this was to work (i.e. check that they have the same structure, not the same resource identifier), but the order of the [[XML]] documents were different, then it should still fail - XML documents have order.

So I wrote a function which will allow you to check two XML documents and make sure they have the same structure, attributes and children, but in any order (below). Use the optional parameter "$text_strict" to test explicitly for all leading and trailing whitespace.

=Usage=
[code]$result = xml_is_equal($xml1, $xml2);
if ($result === true) {
   // the XML documents are the same
} else {
   // they are different: print the reason why
   printf(STDERR, "XML documents are different: $result");
}[/code]

=Code Listing=
[code]function xml_is_equal(SimpleXMLElement $xml1, SimpleXMLElement $xml2, $text_strict = false) {
	// compare text content
	if ($text_strict) {
		if ("$xml1" != "$xml2") return "mismatched text content (strict)";
	} else {
		if (trim("$xml1") != trim("$xml2")) return "mismatched text content";
	}

	// check all attributes
	$search1 = array();
	$search2 = array();
	foreach ($xml1->attributes() as $a => $b) {
		$search1[$a] = "$b";		// force string conversion
	}
	foreach ($xml2->attributes() as $a => $b) {
		$search2[$a] = "$b";
	}
	if ($search1 != $search2) return "mismatched attributes";
	
	// check all namespaces
	$ns1 = array();
	$ns2 = array();
	foreach ($xml1->getNamespaces() as $a => $b) {
		$ns1[$a] = "$b";
	}
	foreach ($xml2->getNamespaces() as $a => $b) {
		$ns2[$a] = "$b";
	}
	if ($ns1 != $ns2) return "mismatched namespaces";
	
	// get all namespace attributes
	foreach ($ns1 as $ns) {			// don't need to cycle over ns2, since its identical to ns1
		$search1 = array();
		$search2 = array();
		foreach ($xml1->attributes($ns) as $a => $b) {
			$search1[$a] = "$b";
		}
		foreach ($xml2->attributes($ns) as $a => $b) {
			$search2[$a] = "$b";
		}
		if ($search1 != $search2) return "mismatched ns:$ns attributes";
	}
	
	// get all children
	$search1 = array();
	$search2 = array();
	foreach ($xml1->children() as $b) {
		if (!isset($search1[$b->getName()]))
			$search1[$b->getName()] = array();
		$search1[$b->getName()][] = $b;
	}
	foreach ($xml2->children() as $b) {
		if (!isset($search2[$b->getName()]))
			$search2[$b->getName()] = array();
		$search2[$b->getName()][] = $b;
	}
	// cycle over children
	if (count($search1) != count($search2)) return "mismatched children count";		// xml2 has less or more children names (we don't have to search through xml2's children too)
	foreach ($search1 as $child_name => $children) {
		if (!isset($search2[$child_name])) return "xml2 does not have child $child_name";		// xml2 has none of this child
		if (count($search1[$child_name]) != count($search2[$child_name])) return "mismatched $child_name children count";		// xml2 has less or more children
		foreach ($children as $child) {
			// do any of search2 children match?
			$found_match = false;
			$reasons = array();
			foreach ($search2[$child_name] as $id => $second_child) {
				if (($r = xml_is_equal($child, $second_child)) === true) {
					// found a match: delete second
					$found_match = true;
					unset($search2[$child_name][$id]);
				} else {
					$reasons[] = $r;
				}
			}
			if (!$found_match) return "xml2 does not have specific $child_name child: " . implode("; ", $reasons);
		}
	}
	
	// finally, cycle over namespaced children 
	foreach ($ns1 as $ns) {			// don't need to cycle over ns2, since its identical to ns1
		// get all children
		$search1 = array();
		$search2 = array();
		foreach ($xml1->children() as $b) {
			if (!isset($search1[$b->getName()]))
				$search1[$b->getName()] = array();
			$search1[$b->getName()][] = $b;
		}
		foreach ($xml2->children() as $b) {
			if (!isset($search2[$b->getName()]))
				$search2[$b->getName()] = array();
			$search2[$b->getName()][] = $b;
		}
		// cycle over children
		if (count($search1) != count($search2)) return "mismatched ns:$ns children count";		// xml2 has less or more children names (we don't have to search through xml2's children too)
		foreach ($search1 as $child_name => $children) {
			if (!isset($search2[$child_name])) return "xml2 does not have ns:$ns child $child_name";		// xml2 has none of this child
			if (count($search1[$child_name]) != count($search2[$child_name])) return "mismatched ns:$ns $child_name children count";		// xml2 has less or more children
			foreach ($children as $child) {
				// do any of search2 children match?
				$found_match = false;
				foreach ($search2[$child_name] as $id => $second_child) {
					if (xml_is_equal($child, $second_child) === true) {
						// found a match: delete second
						$found_match = true;
						unset($search2[$child_name][$id]);
					}
				}
				if (!$found_match) return "xml2 does not have specific ns:$ns $child_name child";
			}
		}
	}	
	
	// if we've got through all of THIS, then we can say that xml1 has the same attributes and children as xml2.
	return true;
}[/code]

{{tag-todo|put code onto SVN and link to actual SVN code}}

[[Category:Article]]
[[Category:PHP]]
[[Category:Programming Snippets]]