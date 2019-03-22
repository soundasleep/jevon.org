require "yaml"

RSpec.describe "pages with whitespace" do
  ALL_WHITESPACE_FILES = Dir['wiki/**/*_*.md'] + Dir['*_*.md']

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
  end

  ALL_WHITESPACE_FILES.each do |file|
    describe "#{file}" do
      let(:alternates) do
        file_path = file.gsub(/(\/)[^\/]+$/i, "\\1")
        file_without_path = file.gsub(file_path, '')
        file_without_ext = file_without_path.gsub(/\..+$/i, '')
        ext = file_without_path.gsub(file_without_ext, '')

        puts "file_path = #{file_path}"
        puts "file_without_path = #{file_without_path}"
        puts "file_without_ext = #{file_without_ext}"
        puts "ext = #{ext}"

        alternates = alternative_paths(file_without_ext)
        alternates.map do |s|
          "/#{file_path}#{s}"
        end.uniq
      end

      it "has redirect_from for all whitespace and capitalition options" do
        frontmatter = YAML.load(File.open(file, 'r'))

        expect(frontmatter["redirect_from"]).to_not be_nil

        alternates.each do |alt|
          expect(frontmatter["redirect_from"]).to include(alt)
        end

        expect(frontmatter["redirect_from"].uniq.sort).to eq frontmatter["redirect_from"].uniq.sort
      end
    end
  end
end
