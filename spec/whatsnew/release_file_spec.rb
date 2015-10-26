RSpec.describe Whatsnew::ReleaseFile do
  let(:release) { sawyer_releases.first }
  let(:release_file) { Whatsnew::ReleaseFile.new(release) }

  describe "#file_name" do
    it "works" do
      expect(release_file.file_name).to eq "Releases"
    end
  end

  describe "#file_url" do
    it "works" do
      expect(release_file.file_url).to eq "https://github.com/benbalter/licensee/releases"
    end
  end

  describe "#content" do
    it "works" do
      expect(release_file.content).to eq "See https://github.com/benbalter/licensee/releases."
    end
  end

  describe "#read" do
    it "works" do
      expect(release_file.read).to eq "What's New:\nSee Releases: https://github.com/benbalter/licensee/releases."
    end
  end
end
