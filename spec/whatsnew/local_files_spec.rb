RSpec.describe Whatsnew::LocalFiles do
  describe "#to_news_file" do
    let(:news_file) { described_class.new(path).to_news_file }

    context "when news file found" do
      let(:path) { "." }

      it "returns NoNewsFile" do
        expect(news_file).to be_a Whatsnew::LocalNewsFile
      end
    end

    context "when news file not found" do
      let(:path) { "/tmp" }

      it "returns NoNewsFile" do
        expect(news_file).to be_a Whatsnew::NoNewsFile
      end
    end
  end
end
