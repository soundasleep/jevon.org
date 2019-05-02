RSpec.describe "Dependencies" do
  let(:lockfile) { Bundler::LockfileParser.new(Bundler.read_file("Gemfile.lock")) }

  it "either has liquid 4.0.0, or we're using sort_natural on pages.md" do
    liquid_version = lockfile.specs.select { |spec| spec.name == "liquid" }.first.version.to_s

    if liquid_version > "4.0.0"
      raise "If liquid version >= 4.0.0, then update pages.md to use sort_natural"
    end
  end
end
