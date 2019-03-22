RSpec.describe "all pages" do
  ALL_FILES = Dir['wiki/**/*.md'] + Dir['*.md']

  it "there is at least one page in the site" do
    expect(ALL_FILES).to_not be_empty
  end
end
