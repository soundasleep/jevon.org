---
layout: page
title:  "Creating a JSON callback page in a Drupal module"
author: jevon
date:   2014-04-02 14:57:42 +1300
---

[[Drupal]]

This can useful for [[AJAX]] scripts or [[REST]] applications. In your `my_module.module`, extend your `hook_menu()`:

[code php]
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
[/code]

And then in `my_module.inc`, <a href="https://drupal.org/node/1613408">use `drupal_json_output`</a>:

[code php]
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
[/code]

You can then access your callback (after clearing your caches) by calling http://localhost/drupal/my/callback.

[[Category:Drupal]]
[[Category:PHP]]
[[Category:Web development]]
[[Category:JSON]]