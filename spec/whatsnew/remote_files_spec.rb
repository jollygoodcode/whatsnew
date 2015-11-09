require "dish"
require "json"

RSpec.describe Whatsnew::RemoteFiles do
  let(:news_file) { Whatsnew::RemoteFiles.new(repo).to_news_file }

  context "without OAuth token" do
    before { }

    it "prints warning" do
      before = ENV.delete "OAUTH_ACCESS_TOKEN"

      expect(STDOUT).to receive(:puts).with("WARNING: No OAuth token is provided.")

      Whatsnew::RemoteFiles.new("foo/bar")

      ENV["OAUTH_ACCESS_TOKEN"] = before
    end
  end

  context "with invalid OAuth token" do
    it "aborts when passed in OAuth token is invalid" do
      expect { Whatsnew::RemoteFiles.new("foo/bar", "invalid") }.to \
        raise_error(SystemExit)
    end

    it "aborts when OAuth token length from ENV is invalid" do
      expect(ENV).to receive(:fetch).with("OAUTH_ACCESS_TOKEN") { "invalid" }

      expect { Whatsnew::RemoteFiles.new("foo/bar") }.to \
        raise_error SystemExit
    end
  end

  context "with Contents API / Resource like object" do
    let(:repo) { "jollygoodcode/whatsnew" }
    let(:client) { double(contents: jollygoodcode_whatsnew) }

    it "returns NewsFile" do
      expect(Octokit::Client).to receive(:new) { client }

      expect(news_file).to be_a Whatsnew::NewsFile
    end
  end

  context "with Releases API" do
    let(:repo) { "octokit/octokit.rb" }
    let(:client) { double(contents: [], releases: octokit_octokitrb) }

    it "returns ReleaseFile" do
      expect(Octokit::Client).to receive(:new) { client }

      expect(news_file).to be_a Whatsnew::ReleaseFile
    end
  end

  context "when not found" do
    let(:repo) { "foo/bar" }
    let(:client) { double(contents: [], releases: []) }

    it "returns NoNewsFile" do
      expect(Octokit::Client).to receive(:new) { client }

      expect(news_file).to be_a Whatsnew::NoNewsFile
    end
  end
end
