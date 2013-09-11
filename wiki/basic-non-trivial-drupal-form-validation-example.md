---
layout: page
title:  "Basic non-trivial Drupal form validation example"
author: jevon
date:   2013-09-11 17:13:11 +1200
---

[[Drupal]]

Define the Drupal pages in `my_hook.module`:

[code php]/**
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
}[/code]

Define the page in `my_hook.inc`, which generates and returns just a form:

[code php]function my_hook_page_subscribe() {
   return drupal_get_form('my_hook_my_form');
}[/code]

Define the form in `my_hook.inc`:

[code php]function my_hook_my_form($form, &$form_state) {
   $form['email'] = array(
      '#type' => 'textfield',
      '#default_value' => '',
      '#title' => t("Your e-mail address"),
      '#size' => 32,
      '#maxlength' => 128,
      '#required' => true,
      '#suffix' => $debug,
   );

   $form['submit'] = array('#type' => 'submit', '#value' => t('Subscribe'));

   return $form;
}[/code]

Define the validate function in `my_hook.inc`:

[code php]function my_hook_my_form_validate($form, &$form_state) {
   if (!valid_email_address($form_state['values']['email'])) {
      // prevents form submission
      form_set_error('email', t('Please enter a valid e-mail address.'));
   }
}[/code]

Finally define the submit function in `my_hook.inc`:

[code php]function my_hook_my_form_submit($form, &$form_state) {
   $_SESSION['my_email'] = $form_state['values']['email'];

   // display message on next load
   drupal_set_message(t("Set e-mail address"));

   // redirect to another page in my module
   drupal_goto('my_hook/list');
}[/code]

This code would all be in a module `sites/all/modules/my_hook/` and implements the hook functions `hook_menu()`, `hook_form()`, `hook_form_submit()` and `hook_form_validate()`.

[[Category:Drupal]]
[[Category:PHP]]
