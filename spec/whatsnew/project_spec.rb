RSpec.describe Whatsnew::Project do
  describe "#news_file" do
    let(:project) { Whatsnew::Project.new path_or_resource }
    let(:newsfile) { double(to_news_file: true) }

    context "when query for remote files" do
      let(:path_or_resource) { "jollygoodcode/whatsnew" }

      it "invokes RemoteFiles" do
        expect(Whatsnew::RemoteFiles).to receive(:new) { newsfile }

        project.news_file
      end
    end

    context "when query for local files" do
      let(:path_or_resource) { "/tmp" }

      it "invokes LocalFiles" do
        expect(Whatsnew::LocalFiles).to receive(:new) { newsfile }

        project.news_file
      end
    end
  end
end
