---
layout: page
title:  "Basic non-trivial Drupal form validation example"
author: jevon
date:   2013-09-11 17:16:26 +1200
tags:   [Drupal, PHP]
---

[Drupal](drupal.md)

Recall that in Drupal, hooks are defined through function naming patterns. This covers the basic implementation of a form (included on a page) with non-trivial validation (i.e. not just through <a href="https://api.drupal.org/api/drupal/developer!topics!forms_api_reference.html/7">`#maxlength`</a> etc) necessary before successful form submission. We also split up the module into `my_hook.module` (core hooks) and `my_hook.inc` (necessary includes).

Define the Drupal pages in `my_hook.module`:

```
/**
 * Implements hook_menu().
 */
function my_hook_menu() {
   $items = array();

   $items['my_hook/index'] = array(
      'title' => 'Set e-mail address',
      'description' => 'Sets an e-mail address session variable',
      'access arguments' => array('access content'),
      // get a page rather than a form (see callback)
      'page callback' => 'my_hook_page_subscribe',
      'file' => 'my_hook.inc',
   );

   $items['my_hook/list'] = array(
      // ...
   );

   return $items;
}
```

Define the page in `my_hook.inc`, which generates and returns just a form:

```
function my_hook_page_subscribe() {
   return drupal_get_form('my_hook_my_form');
}
```

Define the form in `my_hook.inc`:

```
function my_hook_my_form($form, &$form_state) {
   $form['email'] = array(
      '#type' => 'textfield',
      '#default_value' => '',
      '#title' => t("Your e-mail address"),
      '#size' => 32,
      '#maxlength' => 128,
      '#required' => true,
      '#prefix' => '<div>',
      '#suffix' => '</div>',
   );

   $form['submit'] = array('#type' => 'submit', '#value' => t('Subscribe'));

   return $form;
}
```

Define the validate function in `my_hook.inc`:

```
function my_hook_my_form_validate($form, &$form_state) {
   if (!valid_email_address($form_state['values']['email'])) {
      // prevents form submission
      form_set_error('email', t('Please enter a valid e-mail address.'));
   }
}
```

Finally define the submit function in `my_hook.inc`:

```
function my_hook_my_form_submit($form, &$form_state) {
   $_SESSION['my_email'] = $form_state['values']['email'];

   // display message on next load
   drupal_set_message(t("Set e-mail address"));

   // redirect to another page in my module
   drupal_goto('my_hook/list');
}
```

This code would all be in a module `sites/all/modules/my_hook/` and implements the hook functions `hook_menu()`, `hook_form()`, `hook_form_submit()` and `hook_form_validate()`.
