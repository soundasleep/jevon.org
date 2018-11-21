#!/bin/bash ruby

require 'mysql2'
require 'fileutils'

db_name = ARGV[0] or fail("No MySQL database name provided")
db_username = ARGV[1] or fail("No MySQL database username provided")
db_password = ARGV[2] or fail("No MySQL database password provided")
$no_pause_between_commits = (ARGV[3] == "false")

edit_table = "jevonwikiedits"
page_table = "jevonwikipages"
$earliest_edit = '2005-01-01 00:00:00'

ignored_titles = [
  "Special/Counter/Last Reset",
].map { |s| "'#{s}'" }.join(", ")

def select_slug(title)
  title.downcase.gsub(' ', '-')
end

def select_git_author(username)
  case username
  when "jevon"
    return "Jevon Wright <jevon@jevon.org>"
  when "anonymous"
    return "anonymous <nobody@nowhere>"
  else
    return "#{username} <#{username}@journals.jevon.org>"
  end
end

def select_git_reason(reason)
  if reason.nil? || reason.empty?
    "Edit imported from jevon.org"
  else
    "#{reason}\n\nEdit imported from jevon.org"
  end
end

def create_jekyll_content(title, author, updated, content)
  "---
layout: page
title:  \"#{title}\"
author: #{author}
date:   #{updated}
---
#{content}"
end

def shell_escape(s)
  "\"" + s.gsub("\"", "\\\"") + "\""
end

def git_add_and_commit(filename, git_updated, git_author, git_reason)
  # This sets GIT_AUTHOR_DATE but not GIT_COMMITTER_DATE.
  # It's a bit unclear, but 'The author is the person who originally wrote the work,
  # whereas the committer is the person who last applied the work.'
  # So I think this is technically correct? I am committing the change today, but I'm not the author.
  system("git add #{shell_escape(filename)} && git commit --date #{shell_escape(git_updated)} --author #{shell_escape(git_author)} --message #{shell_escape(git_reason})")
end

def process_edit_or_page(row)
  title = row['title']
  author = row['author']
  author = "anonymous" if author.nil? || author.empty?
  reason = row['reason']
  content = row['content']
  updated = row['updated'] || $earliest_edit

  git_author = select_git_author(author)
  git_updated = updated
  git_reason = select_git_reason(reason)

  slug = select_slug(title)
  filename = "wiki/#{slug}.md"

  puts "Updating #{filename} with '#{title}' (#{author} -> #{git_author})"

  file_content = create_jekyll_content(title, author, updated, content)

  FileUtils.mkdir_p(File.dirname(filename)) # make folder recursively
  File.open(filename, 'w') do |fp|
    fp.write(file_content)
  end

  unless $no_pause_between_commits
    puts "Press enter to commit..."
    ignored = STDIN.gets
  end

  git_add_and_commit(filename, git_updated, git_author, git_reason)
end

db = Mysql2::Client.new(username: db_username, password: db_password, database: db_name)

# First: create edits, which are old page versions
edits = db.query("SELECT * FROM #{edit_table} WHERE title NOT IN (#{ignored_titles}) ORDER BY updated ASC")
edits.each do |row|
  process_edit_or_page(row)
end

# Then, create pages, which are the latest versions (and should therefore be done last)
edits = db.query("SELECT * FROM #{page_table} WHERE title NOT IN (#{ignored_titles}) ORDER BY updated ASC")
edits.each do |row|
  process_edit_or_page(row)
end

# TODO create redirections as appropriate
# TODO reformat bbcode format as markdown format automatically
