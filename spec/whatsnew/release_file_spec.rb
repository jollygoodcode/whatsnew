RSpec.describe Whatsnew::ReleaseFile do
  let(:release) { octokit_octokitrb.first }
  let(:release_file) { Whatsnew::ReleaseFile.new(release) }

  describe "#file_name" do
    it "works" do
      expect(release_file.file_name).to eq "Releases"
    end
  end

  describe "#file_url" do
    it "works" do
      expect(release_file.file_url).to eq "https://github.com/octokit/octokit.rb/releases"
    end
  end

  describe "#content" do
    it "works" do
      expect(release_file.content).to eq "See https://github.com/octokit/octokit.rb/releases."
    end
  end

  describe "#read" do
    it "works" do
      expect(release_file.read).to eq "What's New:\nSee Releases: https://github.com/octokit/octokit.rb/releases."
    end
  end
end
