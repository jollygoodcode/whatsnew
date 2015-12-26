RSpec.describe Whatsnew::LocalNewsFile do
  let(:local_news_file) do
     Dir.glob(File.join(".", "*".freeze)).find do |local_file|
      local_file =~ %r{(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)}i.freeze
    end
  end
  let(:news_file) { described_class.new(local_news_file, ".") }

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
      expect(news_file.content).to eq IO.read("./CHANGELOG.md")
    end
  end

  describe "#read" do
    it "works" do
      expect(news_file.read).to eq "What's New:\nSee CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
    end
  end
end
