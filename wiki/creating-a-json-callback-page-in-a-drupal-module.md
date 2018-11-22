---
layout: page
title:  "Creating a JSON callback page in a Drupal module"
author: jevon
date:   2014-04-02 14:57:51 +1300
tags:   [Drupal, PHP, Web development, JSON]
---

[Drupal](drupal.md)

This can useful for [AJAX](ajax.md) scripts or [REST](rest.md) applications that need [JSON](json.md) output. In your `my_module.module`, extend your `hook_menu()`:

```
/**
 * Implements hook_menu().
 */
function my_module_menu() {
  $items = array();

  // ...

  // issue #1210: provide a passthrough for blog post comments
  $items['my/callback] = array(
    'title' => 'My callback',
    'description' => 'My callback description',
    'access arguments' => TRUE,
    'access callback' => TRUE,
    'page callback' => 'my_module_json_callback',
    'file' => 'my_module.inc',
  );

  return $items;
}
```

And then in `my_module.inc`, <a href="https://drupal.org/node/1613408">use `drupal_json_output`</a>:

```
/**
 * Page callback.
 */
function my_module_json_callback() {
  $json = array(
    'hello' => 'world',
    'meow' => array(1,2,3),
  );

  drupal_json_output($json);
}
```

You can then access your callback (after clearing your caches) by calling http://localhost/drupal/my/callback.
