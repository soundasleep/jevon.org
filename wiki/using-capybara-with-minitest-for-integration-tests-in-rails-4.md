---
layout: page
title:  "Using Capybara with Minitest for Integration Tests in Rails 4"
author: jevon
date:   2014-09-11 20:30:44 +1200
---

[[Ruby on Rails]] / [[Capybara]]

Not as obvious or straightforward as it should be, since most Capybara code is based on [[RSpec]], but Rails 4 comes with [[Minitest]] by default. Based on <a href="http://techiferous.com/2010/04/using-capybara-in-rails-3/">this Rails 3 guide</a>:

1. Add new bundles and run `bundle install`:

[code]
gem 'capybara'
gem 'launchy'
[/code]

2. Create a new `test/integration_test_helper.rb`, just like the existing `test_helper.rb` there, to import all of the Capybara DSL methods:

[code ruby]
require "test_helper"
require "capybara/rails"

module ActionDispatch
  class IntegrationTest
    include Capybara::DSL
  end
end
[/code]

3. Create a test under `test/integration/create_player_test.rb` (this extends the same normal integration tests superclass _ActionDispatch::IntegrationTest_):

[code ruby]
require "integration_test_helper"

class CreatePlayerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(name: "Test user", provider: "testing")
    @user.save()
  end

  teardown do
    @user.destroy
  end

  def do_login!
    # login through test method
    visit "/sessions/test?id=#{@user.id}"
    assert_equal "/player/new", current_path
  end

  test "create a new player" do
    do_login!

    visit "/player/new"
    assert page.has_field?("Name", with: @user.name)
    click_button "Start playing"

    assert page.has_content?("You are currently at Home")
  end

end
[/code]

4. Run your tests with `rake test:integration` (which will also be run as part of `rake test`).

Assertions such as `expect(current_path).to == "/player/new"` and `current_path.should == "/player/new"` are [[RSpec]] idioms, and they won't work with <a href="http://ruby-doc.org/stdlib-2.1.1/libdoc/test/unit/rdoc/Test/Unit/Assertions.html">[[Minitest]] assertions</a>.

[[Category:Ruby]]
[[Category:Ruby on Rails]]
[[Category:Testing]]