---
layout: page
title:  CSS
author: jevon
date:   2014-05-14 22:29:55 +12:00
tags:
  - Technology
  - Internet
---

Cascading Stylesheets is a way to specify presentational aspects of [HTML](html.md) pages. See also [SASS](SASS.md)

## Reference
```
h2               { /* style all h2 elements */ }
h2.foo           { /* ...with className=foo */ }
h2#foo           { /* ...with id=foo */ }
*                { /* style all elements */ }

h2 a             { /* style all of h2's a elements ("descendant") */ }
h2 > a           { /* ... but only direct children */ }
h2 + h3          { /* style the h3 which is the next sibling of an h2 */ }

h2[title]        { /* style all h2's with title attributes */ }
h2[title="foo"]  { /* ... title attribute equals "foo" */ }
h2[title~="foo"] { /* ... title attribute, split with spaces, has "foo" */ }
h2[title|="foo"] { /* ... title attribute, split with hyphens, has "foo" */ }

/* pseudo-classes */
h2:first-child, h2:last-child, h2:nth-child { /* children */ }
h2:first-line, h2:first-letter              { /* characters */ }
h2:link, h2:visited, h2:hover, h2:active    { /* links */ }
h2:focus                                    { /* element has focus */ }
h2:lang(en}                                 { /* ?? */ }
h2:before, h2:after                         { /* insert content: before and after element */ }
h2:checked                                  { /* element is checked */ }
```

Sources:
1. http://css.maxdesign.com.au/selectutorial/
1. http://kimblim.dk/csstest/

## Positioning Floats
```
div {            /* will move the object up 120px, but a 120px gap will remain */
   position: relative;
   top: -120px;
}

div {            /* will move the object up 120px, and there will be no gap */
   float: right;
   margin-top: -120px;
}
```
