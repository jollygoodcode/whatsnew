require "open3"

RSpec.describe "Executable" do
  let(:root) { File.expand_path "../../..", File.dirname(__FILE__) }

  def capture_executable_output(cli_argument: command_line_argument)
    Open3.capture3("#{root}/bin/whatsnew #{cli_argument}")
  end

  context "whatsnew about" do
    context "without argument" do
      let(:command_line_argument) { "about" }

      it "finds changelog in current folder" do
        stdout, _, _ = capture_executable_output

        expect(stdout).to include "What's New"
        expect(stdout).to include "See CHANGELOG.md"
      end
    end

    context "pass in path contains changelog" do
      it "finds changelog in path" do
        Dir.mktmpdir do |dir|
          Dir.chdir(dir) { `touch NEWS` }

          stdout, _, _ = capture_executable_output(cli_argument: "about #{dir}")

          expect(stdout).to include "What's New"
          expect(stdout).to include "See NEWS"
        end
      end
    end

    context "pass in path contains no changelog" do
      let(:command_line_argument) { "about /dev/null" }

      it "no news file" do
        stdout, _, _ = capture_executable_output

        expect(stdout).to include "Not found. This project should keep a changelog."
        expect(stdout).to include "Please see http://keepachangelog.com."
      end
    end

    context "pass in owner/repo contains changelog" do
      let(:command_line_argument) { "about jollygoodcode/whatsnew" }

      before do
        expect(Octokit::Client).to receive(:new) do
          double(contents: jollygoodcode_whatsnew)
        end
      end

      it "finds changelog" do
        stdout, _, _ = capture_executable_output

        expect(stdout).to include "What's New"
        expect(stdout).to include "See CHANGELOG.md"
        expect(stdout).to include "https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
      end
    end

    context "pass in owner/repo contains no changelog but releases" do
      let(:command_line_argument) { "about octokit/octokit.rb" }

      before do
        expect(Octokit::Client).to receive(:new) do
          double(contents: [], releases: octokit_octokitrb)
        end
      end

      it "finds non-empty releases" do
        stdout, _, _ = capture_executable_output

        expect(stdout).to include "What's New"
        expect(stdout).to include "See Releases: https://github.com/octokit/octokit.rb/releases."
      end
    end

    context "pass in owner/repo contains no changelog and no releases" do
      let(:command_line_argument) { "about jollygoodcode/nothing" }

      before do
        expect(Octokit::Client).to receive(:new) do
          double(contents: [], releases: [])
        end
      end

      it "not found" do
        stdout, _, _ = capture_executable_output

        expect(stdout).to include "Not found. This project should keep a changelog."
        expect(stdout).to include "Please see http://keepachangelog.com."
      end
    end
  end
end
