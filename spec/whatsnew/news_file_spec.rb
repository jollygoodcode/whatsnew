RSpec.describe Whatsnew::NewsFile do
  let(:content) do
    jollygoodcode_whatsnew.find do |resource|
      resource.name =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
    end
  end
  let(:news_file) { Whatsnew::NewsFile.new(content) }

  describe "#file_name" do
    it "works" do
      expect(news_file.file_name).to eq "CHANGELOG.md"
    end
  end

  describe "#file_url" do
    it "works" do
      expect(news_file.file_url).to eq "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md"
    end
  end

  describe "#content" do
    it "works" do
      expect(news_file.content).to eq "See https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
    end
  end

  describe "#read" do
    it "works" do
      expect(news_file.read).to eq "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
    end
  end
end
