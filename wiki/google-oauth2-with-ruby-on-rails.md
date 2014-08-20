---
layout: page
title:  "Google OAuth2 with Ruby on Rails"
author: jevon
date:   2014-08-20 22:12:30 +1200
---

[[Ruby on Rails]] / [[OAuth2]]

I tried doing this <a href="http://nationbuilder.com/ruby_api_example">manually using the `oauth2` gem</a>, but while it <a href="https://github.com/soundasleep/rrw/commit/6f83482fe0d25fa05ddc24c9020b69afefddf0a2">kind-of works</a>, getting any sort of user information requires you to <a href="http://openid.net/specs/draft-jones-json-web-token-07.html">decode a JWT payload</a> (ugh, [[OpenID]] why does [[Google]] no longer support you).

Instead I got it working with just the `omniauth-google-oauth2` gem. Based on <a href="http://blog.myitcv.org.uk/2013/02/19/omniauth-google-oauth2-example.html">this tutorial</a> which is for an older version of Rails:

1. Add new bundles and run `bundle install`:

[code]
gem 'haml'
gem 'figaro'
gem 'omniauth-google-oauth2'
[/code]

2. Create a new controller for sessions, and a new database model for users:

[code]
rails generate session_migration
rails generate controller sessions
rails generate model user provider:string 
  uid:string 
  name:string 
  refresh_token:string 
  access_token:string 
  expires:timestamp
rake db:migrate
[/code]

3. Configure the session to use a database rather than <a href="http://stackoverflow.com/questions/9473808/cookie-overflow-in-rails-application">cookies which have a 4KB limit</a>:

[code]
# config/initializers/session_store.rb

Example::Application.config.session_store :active_record_store
[/code]

4. Create your SessionsController:

[code ruby]
# /app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth["provider"], :uid => auth["uid"]).first_or_initialize(
      :refresh_token => auth["credentials"]["refresh_token"],
      :access_token => auth["credentials"]["token"],
      :expires => auth["credentials"]["expires_at"],
      :name => auth["info"]["name"],
    )
    url = session[:return_to] || root_path
    session[:return_to] = nil
    url = root_path if url.eql?('/logout')

    if user.save
      session[:user_id] = user.id
      notice = "Signed in!"
      logger.debug "URL to redirect to: #{url}"
      redirect_to url, :notice => notice
    else
      raise "Failed to login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
[/code]

5. Login to your <a href="https://console.developers.google.com/project">Google Developers Console</a>, create a new Project, and visit *APIs & Auth*:

* *APIs:* enable Contacts API and Google+ API, to prevent <a href="http://stackoverflow.com/a/23904532/39531">Access Not Configured. Please use Google Developers Console to activate the API for your project.</a>
* *Consent screen:* make sure you have an email and product name specified
* *Credentials:* create a new Client ID of type web applicaton, setting your _Redirect URI_ to http://localhost:3000/auth/google_login/callback 

6. Edit `config/application.yml` with these Google keys (`figaro` will make all of these settings available through `ENV[property]`):

[code yml]
# config/application.yml

OAUTH_CLIENT_ID: "<CLIENT_ID>"
OAUTH_CLIENT_SECRET: "<CLIENT_SECRET>"
APPLICATION_CONFIG_SECRET_TOKEN: "<A LONG SECRET>"
[/code]

7. Enable Omniauth to use Googleauth2 as a provider (`approval_prompt` must be an empty string <a href="http://blog.myitcv.org.uk/2013/02/19/omniauth-google-oauth2-example.html">otherwise it will force a prompt on every login</a>):

[code ruby]
# /config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    ENV['OAUTH_CLIENT_ID'],
    ENV['OAUTH_CLIENT_SECRET'],
    {name: "google_login", approval_prompt: ''}
end
[/code]

8. Enable new routes:

[code ruby]
# /config/routes.rb

Example::Application.routes.draw do
  # ...
  get "/auth/google_login/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
end
[/code]

9. Now finally, you can add login/logout links in your navigation template, or whatever:

[code haml]
# /app/views/home/index.html.haml

%p
  - if current_user
    = link_to "Sign out", signout_path
    = current_user.name
    = current_user.inspect
  - else
    = link_to "Sign in with Google", "/auth/google_login"
[/code]

10. Which uses a helper method, `current_user`, which loads the `User` model based on the session `user_id`:

[code ruby]
# /app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  // ...
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
[/code]

[[Category:Ruby on Rails]]
[[Category:Ruby]]
[[Category:OAuth2]]