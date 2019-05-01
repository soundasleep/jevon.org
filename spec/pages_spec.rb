RSpec.describe "all pages" do
  ALL_FILES = Dir['wiki/**/*.md'] + Dir['*.md']

  it "there is at least one page in the site" do
    expect(ALL_FILES).to_not be_empty
  end

  ALL_FILES.each do |file|
    describe "#{file}" do
      let(:file_contents) { File.read(file) }
      let(:frontmatter) { YAML.load(file_contents) }
      let(:matter) { file_contents.split("---").last.strip }

      it "does not have any case-sensitive includes" do
        # {% include gmf-css.md %}
        expect(file_contents.match(/\{% include [^ ]*[A-Z][^% ]* %\}/)).to eq nil
      end

      it "uses /wiki/*.md to link to other markdown files" do
        # [link](wiki/foo.md) is wrong, and won't generate the correct link;
        # it should be [link](/wiki/foo.md).
        expect(file_contents.match(/\[([^\]]+)\]\(wiki\/([^)]+)/)).to eq nil
      end
    end
  end
end
