---
layout: page
title:  "Selectize"
author: jevon
date:   2014-06-17 16:58:40 +1200
---

[[Javascript]]

[[Selectize]] is a [[Javascript]] component, similar to [[Select2]], that provides a "better" `&lt;select&gt;` element, or something.

It seems that `selectize` is a smaller and simpler component, but is dreadful to restyle.

==Preventing placeholder text from being greyed out==

Because the placeholder text is actually an `&lt;input type="text" placeholder="..."&gt;`, we need to override each browsers' implementation of the placeholder text ourselves, using <a href="http://stackoverflow.com/questions/2610497/change-an-inputs-html5-placeholder-color-with-css">rowser-specific selectors and individual selectors for each browser</a>:

[code css]
  .container {
    // the text is rendered in grey because it's an <input placeholder="..">;
    // to override it, we need to use lots of vendor-specific prefixes
    // see http://stackoverflow.com/questions/19143364/how-to-change-placeholder-of-selectize-js-dropdown
    // and we need to have separate rules for each browser, because
    // "a group of selectors containing an invalid selector is invalid"
    ::-webkit-input-placeholder { /* WebKit browsers */
      color: $text-black;
    }
    :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
      color: $text-black;
      opacity: 1;
    }
    ::-moz-placeholder { /* Mozilla Firefox 19+ */
      color: $text-black;
      opacity: 1;
    }
    :-ms-input-placeholder { /* Internet Explorer 10+ */
      color: $text-black;
    }
  }
[/code]

[[Category:Javascript]]