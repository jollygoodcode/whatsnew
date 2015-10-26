require "dish"
require "json"

RSpec.describe Whatsnew::RemoteFiles do
  let(:news_file) { Whatsnew::RemoteFiles.new(resources).to_news_file }

  context "Contents API / Resource like object" do
    let(:resources) { sawyer_contents }

    it "returns NewsFile" do
      expect(news_file).to be_a Whatsnew::NewsFile
    end
  end

  context "Releases API" do
    let(:resources) { sawyer_releases }

    it "returns ReleaseFile" do
      expect(news_file).to be_a Whatsnew::ReleaseFile
    end
  end

  context "when not found" do
    let(:resources) { [] }

    it "returns NoNewsFile" do
      expect(news_file).to be_a Whatsnew::NoNewsFile
    end
  end
end
