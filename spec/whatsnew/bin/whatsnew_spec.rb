require "open3"

RSpec.describe "Executable" do
  let(:root) { File.expand_path "../../..", File.dirname(__FILE__) }

  it "works" do
    stdout, stderr, status = Open3.capture3("#{root}/bin/whatsnew")

    expect(stdout).to include "What's New"
    expect(stdout).to include "See CHANGELOG.md: https://github.com/jollygoodcode/whatsnew/blob/master/CHANGELOG.md."
    expect(stderr).to be_empty
    expect(status).to eq 0
  end

  it "no news file" do
    # /tmp does not have changelog
    stdout, stderr, status = Dir.chdir("/tmp") do
      Open3.capture3("#{root}/bin/whatsnew")
    end

    expect(stdout.chomp!).to eq "NOT FOUND"
    expect(stderr).to be_empty
    expect(status).to eq 0
  end
end
