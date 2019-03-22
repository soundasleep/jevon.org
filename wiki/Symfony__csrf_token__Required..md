---
layout: page
title:  "Symfony: csrf token: Required."
author: jevon
date:   2012-04-25 13:33:51 +1200
tags:   [Symfony, PHP]
---

[Symfony](Symfony.md)

I was getting this error while trying to create a custom form in Symfony 1.4.

Firstly, make sure that you define the widgets, the validators, the schema labels, _and_ the name format in the form class:

```
class LoginForm extends BaseForm {

    public function configure() {
        
        $this->setWidgets(array(
            'email'         => new sfWidgetFormInputText(),
            'password'      => new sfWidgetFormInputPassword(),
        ));
        
        $this->setValidators(array(
            'email'         => new sfValidatorEmail(),
            'password'      => new sfValidatorString(array('min_length' => 6)),
        ));
        
        $this->widgetSchema->setLabels(array(
            'email'         => 'E-mail address',
            'password'      => 'Password',
        ));
        
        $this->widgetSchema->setNameFormat("login[%s]");
    
    }

}
```

Secondly, make sure that you are rendering the form using _both_ `echo $form` and `echo $form->renderHiddenFields();`:

```
<?php use_stylesheets_for_form($form) ?>
<?php use_javascripts_for_form($form) ?>

<form action="<?php echo url_for('user/login'); ?>" method="post" <?php $form->isMultipart() and print 'enctype="multipart/form-data" ' ?>>
<?php echo $form->renderHiddenFields()?>
<input type="submit" value="Login" />
<?php echo $form ?>
</form>
```

Finally, ensure that you have the correct logic in your `actions.class.php`:

```
public function executeLogin(sfWebRequest $request) {
    $this->form = new LoginForm();
    
    // it's important to check for POST method, rather than the existence of parameters, e.g. $request->hasParameter()
    if ($request->isMethod(sfRequest::POST)) {
        $this->processLoginForm($request, $this->form);
    } else {
        // don't do anything
    }
    
  }

  protected function processLoginForm(sfWebRequest $request, sfForm $form)
  {
    $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
    if ($form->isValid())
    {
      // do some logic here

      $this->redirect('user/show?id='.$User->getId());
    }
  }
```
