RSpec.describe "Markdown pages" do
  ALL_FILES = (Dir['wiki/**/*.md'] + Dir['*.md']).sort

  let(:files_without_path) { ALL_FILES.map { |f| f.gsub(/^wiki\//, "") } }

  it "there is at least one page in the site" do
    expect(ALL_FILES).to_not be_empty
  end

  ALL_FILES.each do |file|
    describe "#{file}" do
      let(:file_contents) { File.read(file) }
      let(:frontmatter) { YAML.load(file_contents) }
      let(:matter) { file_contents.split("---", 2).last.strip }
      let(:matter_downcase) { matter.downcase }

      it "does not have any case-sensitive includes" do
        # {% include gmf-css.md %}
        expect(file_contents.match(/\{% include [^ ]*[A-Z][^% ]* %\}/)).to eq nil
      end

      it "uses /wiki/*.md to link to other markdown files" do
        # [link](wiki/foo.md) is wrong, and won't generate the correct link;
        # it should be [link](/wiki/foo.md).
        expect(matter.match(/\[([^\]]+)\]\(wiki\/([^)]+)/)).to eq nil
      end

      it "has case-sensitive links to other markdown files" do
        files_without_path.each do |file|
          matter.scan(/\(#{Regexp.quote(file)}\)/i).each do |match|
            expected = "(#{file})"
            expect(match).to eq "(#{file})"
          end
        end
      end

      it "does not link to hyphen-case versions of the files" do
        files_without_path.select { |file| file.include?("_") }.each do |file|
          expect(matter_downcase).to_not include("(#{file.gsub("_", "-")})".downcase)
        end
      end
    end
  end
end
