require "yaml"

RSpec.describe "pages with whitespace" do
  #ALL_WHITESPACE_FILES = Dir['wiki/**/*_*.md'] + Dir['*_*.md']
  ALL_WHITESPACE_FILES = Dir['wiki/**/*.md'] # + Dir['*.md']

  it "there is at least one page to test" do
    expect(ALL_WHITESPACE_FILES).to_not be_empty
  end

  def alternative_paths(filename)
    if filename.include?(".")
      raise ArgumentError, "Cannot use on a filename with a file extension: #{filename}"
    end

    if filename.include?("/")
      raise ArgumentError, "Cannot use on a full path: #{filename}"
    end

    alternatives = [
      filename.downcase,
      filename.split("_").map(&:capitalize).join(" "),
      filename.split("_").map(&:downcase).join(" "),
      filename.split("_").map(&:capitalize).join("_"),
      filename.split("_").map(&:downcase).join("_"),
    ].uniq - [filename]

    return alternatives
  end

  describe "#alternative_paths" do
    let(:subject) { alternative_paths(filename) }

    context "my_page" do
      let(:filename) { "my_page" }

      it "returns different options" do
        expect(subject.sort).to eq [
          "My_Page",
          "my page",
          "My Page",
        ].sort
      end

      it "does not include the original filename" do
        expect(subject).to_not include(filename)
      end
    end

    context "My_Page" do
      let(:filename) { "My_Page" }

      it "returns different options" do
        expect(subject.sort).to eq [
          "my_page",
          "my page",
          "My Page",
        ].sort
      end

      it "does not include the original filename" do
        expect(subject).to_not include(filename)
      end
    end

    context "My_PAGE" do
      let(:filename) { "My_PAGE" }

      it "returns different options" do
        expect(subject.sort).to eq [
          "my_page",
          "my page",
          "My Page",
          "My_Page",
        ].sort
      end

      it "does not include the original filename" do
        expect(subject).to_not include(filename)
      end
    end
  end

  ALL_WHITESPACE_FILES.each do |file|
    describe "#{file}" do
      let(:file_path) { file.gsub(/(\/)[^\/]+$/i, "\\1") }
      let(:file_without_path) { file.gsub(file_path, '') }
      let(:file_without_ext) { file_without_path.gsub(/\..+$/i, '') }
      let(:ext) { file_without_path.gsub(file_without_ext, '') }

      let(:alternates) do
        alternates = alternative_paths(file_without_ext)
        alternates.map do |s|
          "/#{file_path}#{s}"
        end.uniq
      end

      let(:file_contents) { File.read(file) }
      let(:frontmatter) { YAML.load(file_contents) }
      let(:matter) { file_contents.split("---").last.strip }

      if false
        it "has redirect_from for all whitespace and capitalition options" do
          expect(frontmatter["redirect_from"]).to_not be_nil

          alternates.each do |alt|
            expect(frontmatter["redirect_from"]).to include(alt)
          end

          expect(frontmatter["redirect_from"].uniq.sort).to eq frontmatter["redirect_from"].uniq.sort
        end
      end

      # We want to use /wiki/My_Page rather than /wiki/my-page, it reads better
      # (and it's also how jevon.org worked before).
      # Rather than re-export the old content, we'll rewrite them in rspec,
      # because that's easier
      if false # enable to rewrite pages from camel_case to Proper_Case
        let(:old_to_new_filename_mapping) do
          # Dir['wiki/**/*.md'].map do |file|
          #   puts "Loading #{file}..."
          #   yaml = YAML.load(File.read(file))
          #   title = yaml["title"]

          #   expected_filename = "#{title.downcase.gsub(/[^a-z0-9_\-\/]+/i, '-')}.md"
          #   new_filename = "#{title.gsub(/[ :]/i, '_')}.md"

          #   puts "Checking for #{title} -> #{expected_filename} (-> #{new_filename})..."
          #   expect(File.exist?("wiki/#{expected_filename}")).to eq true

          #   [ expected_filename, new_filename ]
          # end.to_h
          YAML.load(File.read(".mapping.yml"))
        end

        let(:formatted_filename) { frontmatter["title"].gsub(/[ :]/, '_') }
        let(:new_filename) { "#{file_path}#{formatted_filename}.md" }

        it "can rename file names" do
          expect(old_to_new_filename_mapping).to_not be_empty
          # File.write(".mapping.yml", YAML.dump(old_to_new_filename_mapping))

          puts "Rename #{file} -> #{new_filename}"
          out = `git mv "#{file}" #{new_filename}`

          expect(File.exist?(file)).to eq false
          expect(File.exist?(new_filename)).to eq true

          # and then rewrite any () hrefs
          puts "Rewriting any internal links..."
          input_file = File.read(new_filename)
          old_to_new_filename_mapping.each do |expected_file, new_file|
            input_file = input_file.gsub(expected_file, new_file)
          end

          File.write(new_filename, input_file)
        end
      end

      if false # enable to rewrite pages as a script
        it "can rewrite the whitespace options" do
          frontmatter["redirect_from"] ||= []
          frontmatter["redirect_from"] += alternates
          frontmatter["redirect_from"].uniq!

          pretty_frontmatter = YAML.dump(frontmatter)
              .gsub(/\n- /i, "\n  - ")
              .gsub(/\ntitle: /i, "\ntitle:  ") # common formatting
              .gsub(/\ndate: /i,  "\ndate:   ")
              .gsub(".000000000", "") # no need to have all these ms

          content = "#{pretty_frontmatter}---\n\n#{matter}\n"

          File.write(file, content)
          puts "Rewrote #{file}"
        end
      end
    end
  end
end
