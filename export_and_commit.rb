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
  title.downcase.gsub(/[^A-Z0-9\-_\/]+/i, '-') # allow / for folders
end

def select_filename(slug)
  "wiki/#{slug}.md"
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

def select_git_reason(reason, filename, title)
  if reason.nil? || reason.empty?
    if File.exists?(filename)
      "Updated '#{title}'\n\nEdit imported from jevon.org using export_and_commit.rb"
    else
      "Created '#{title}'\n\nEdit imported from jevon.org using export_and_commit.rb"
    end
  else
    "#{reason}\n\nEdit imported from jevon.org using export_and_commit.rb"
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
  "\"" + "#{s}".gsub("\"", "\\\"") + "\""
end

def git_add_and_commit(filename, git_updated, git_author, git_reason)
  # This sets GIT_AUTHOR_DATE but not GIT_COMMITTER_DATE.
  # It's a bit unclear, but 'The author is the person who originally wrote the work,
  # whereas the committer is the person who last applied the work.'
  # So I think this is technically correct? I am committing the change today, but I'm not the author.
  system("git add #{shell_escape(filename)} && git commit --date #{shell_escape(git_updated)} --author #{shell_escape(git_author)} --message #{shell_escape(git_reason)}")
end

def process_edit_or_page(row)
  title = row['title']
  author = row['author']
  author = "anonymous" if author.nil? || author.empty?
  reason = row['reason']
  content = row['content']
  updated = row['updated'] || $earliest_edit

  slug = select_slug(title)
  filename = select_filename(slug)

  git_author = select_git_author(author)
  git_updated = updated
  git_reason = select_git_reason(reason, filename, title)

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

def generate_markdown(bbcode)
  # Ignore the frontmatter
  frontmatter = bbcode.split("---", 3)
  if frontmatter.length != 3
    fail "Expected three parts in #{bbcode}"
  end
  markdown = frontmatter.last.strip

  # Strip out categories
  tags = []
  markdown = markdown.gsub(/\[\[Category:([^|\[\]]+)\]\]/i) do |match|
    tags << $1 # includes spaces, capitalisation
    ""
  end
  tags = tags.uniq

  # Code blocks
  markdown = markdown
    .gsub(/\[code\]([^\n]+?)\[\/code\]/i, "`\\1`") # single-line version
    .gsub(/\[code ([^\]]+)\]\n*(.+?)\n*\[\/code\]/im, "```\\1\n\\2\n```")
    .gsub(/\[code\]\n*(.+?)\n*\[\/code\]/im, "```\n\\1\n```")

  code_blocks = {}

  # Escape invalid {% and %} in code blocks, and then remove it from further matching
  # https://stackoverflow.com/questions/3426182/how-to-escape-liquid-template-tags
  markdown = markdown.gsub(/```([^\n]*)\n(.+?)```/im) do |match|
    key = sprintf("%09d", code_blocks.length)
    replaced = $2.strip
      .gsub("{{", "{{ \"{{\" }}")
      .gsub("{%", "{{ \"{%\" }}")

    code_blocks[key] = "```#{$1}\n#{replaced}\n```"

    "__CODE_BLOCK_#{key}__"
  end

  # Lists
  markdown = markdown
    .gsub(/^# (.+)$/i, "1. \\1")
    .gsub(/^( |  |\t)# *(.+)$/i, "  1. \\1")

  # Headers
  markdown = markdown
    .gsub(/^==== *(.+) *====$/i, "#### \\1")
    .gsub(/^=== *(.+) *===$/i, "### \\1")
    .gsub(/^== *(.+) *==$/i, "## \\1")
    .gsub(/^= *(.+) *=$/i, "# \\1")

  # Italics, bold
  markdown = markdown
    .gsub(/'''(.+?)'''/i, "**\\1**")
    .gsub(/''(.+?)''/i, "_\\1_")

  # Replace [[link|title]] with [markdown links](markdown link)
  markdown = markdown.gsub(/\[\[([^|\[\]]+)\|([^|\[\]]+)\]\]/i) do |match|
    "[#{$2}](#{select_slug($1)}.md)"
  end

  # Replace [[link]] with [markdown links](markdown link)
  markdown = markdown.gsub(/\[\[([^|\[\]]+)\]\]/i) do |match|
    "[#{$1}](#{select_slug($1)}.md)"
  end

  # Replace old {{include|var=value}} format with jekyll {% include filename %}
  markdown = markdown.gsub(/\{\{([^|}]+)\|(.+?)=(.*)\}\}/i) do |match|
    "{% include #{select_slug($1)}.md #{$2}=\"#{$3}\" %}"
    # "<!-- #{match} -->"
  end

  # Replace old {{include|random text}} format with jekyll {% include filename %}
  markdown = markdown.gsub(/\{\{([^|}]+)\|(.+?)\}\}/i) do |match|
    "{% include #{select_slug($1)}.md comment=\"#{$2}\" %}"
    # "<!-- #{match} -->"
  end

  # Replace old {{include}} format with jekyll {% include filename %}
  markdown = markdown.gsub(/\{\{([^}]+)\}\}/i) do |match|
    "{% include #{select_slug($1)}.md %}"
    # "<!-- #{match.gsub("{{", "include ").gsub("}}", "")} -->"
  end

  # Replace old {stub} -> include
  markdown = markdown.gsub("{stub}", "{% include stub.md %}")

  # Return code blocks
  markdown = markdown.gsub(/__CODE_BLOCK_([0-9]+)__/) do |match|
    key = $1
    code_blocks[$1]
  end

  # Join them all back together
  return "---
#{frontmatter[1].strip}
tags:   [#{tags.join(", ")}]
---

#{markdown.strip}
"
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

# Finally, do a quick and dirty bbcode -> markdown reformat
Dir.glob("wiki/**/*.md") do |filename|
  input = File.read(filename)

  markdown = generate_markdown(input)

  puts "Rewriting #{filename} from bbcode (#{input.length}) to markdown (#{markdown.length})"

  File.open(filename, 'w') do |fp|
    fp.write(markdown)
  end

  # We don't create an individual commit for each markdown; that's useless.
  # It's much better to have a single commit that does ALL of it at once.
  # We'll leave it up to the person running the script to do the commit.
end
