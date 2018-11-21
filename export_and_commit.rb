#!/bin/bash ruby

require 'mysql2'

db_name = ARGV[0] or fail("No MySQL database name provided")
db_username = ARGV[1] or fail("No MySQL database username provided")
db_password = ARGV[2] or fail("No MySQL database password provided")
no_pause_between_commits = (ARGV[3] == "false")

edit_table = "jevonwikiedits"
page_table = "jevonwikipages"
earliest_edit = '2005-01-01 00:00:00'

ignored_titles = [
  "Special/Counter/Last Reset",
].map { |s| "'#{s}'" }.join(", ")

db = Mysql2::Client.new(username: db_username, password: db_password, database: db_name)

edits = db.query("SELECT * FROM #{edit_table} WHERE title NOT IN (#{ignored_titles}) ORDER BY updated ASC LIMIT 5")
edits.each do |row|
  title = row['title']
  author = row['author']
  reason = row['reason']
  content = row['content']
  updated = row['updated'] || earliest_edit

  slug = title.downcase.gsub(' ', '-')
  filename = "wiki/#{slug}.md"

  puts "Updating #{filename} with '#{title}' (#{author})"

  file_content = "---
layout: page
title:  \"#{title}\"
author: #{author}
date:   #{updated}
---
#{content}"

  File.open(filename, 'w') do |fp|
    fp.write(file_content)
  end

  unless no_pause_between_commits
    puts "Press enter to continue..."
    ignored = gets
  end
end

# TODO create redirections as appropriate
