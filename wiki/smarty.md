---
layout: page
title:  "Smarty"
author: anonymous
date:   2006-11-05 05:59:52 +1300
---

<table width=100% border=0 cellpadding=5>
{section name=i loop=$root_categories}
{if $smarty.section.i.index is div by 2}<tr>{/if}
<td width=1% align=center>
	{if $root_categories[i][3] ne ""}<a href="index.php?categoryID={$root_categories[i][0]}"><img border=0 src="products_pictures/{$root_categories[i][3]}" alt="{$root_categories[i][1]}">{/if}
</td>
<td>
		<a href="index.php?categoryID={$root_categories[i][0]}" class=cat>{$root_categories[i][1]}</a> <b>[{$root_categories[i][2]}]</b>:<br>

		{* show sub categories *}
		{assign var="tmp" value=0}
		{section name=j loop=$root_categories_subs}
		  {if $root_categories_subs[j][3] == $root_categories[i][0]}
		    
			{if $tmp == 1}|
			{else}
				{assign va