RSpec.describe Whatsnew::Project do
  describe "#news_file" do
    let(:project) { Whatsnew::Project.new path_or_resource }
    context "remote files" do
      context "contents" do
        let(:path_or_resource) { sawyer_contents }

        it "works" do
          expect(Whatsnew::RemoteFiles).to receive(:new) { spy }

          project.news_file
        end
      end

      context "releases" do
        let(:path_or_resource) { sawyer_releases }

        it "works" do
          expect(Whatsnew::RemoteFiles).to receive(:new) { spy }

          project.news_file
        end
      end

      context "resources" do
        Resource = Struct.new(:name, :html_url)
        let(:path_or_resource) { [Resource.new("foo", "bar")] }

        it "works" do
          expect(Whatsnew::RemoteFiles).to receive(:new) { spy }

          project.news_file
        end
      end
    end

    context "local files" do
      let(:path_or_resource) { "/tmp" }

      it "works" do
        expect(Whatsnew::LocalFiles).to receive(:new) { spy }

        project.news_file
      end
    end
  end
end
