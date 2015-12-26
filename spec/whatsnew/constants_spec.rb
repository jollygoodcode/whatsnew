RSpec.describe Whatsnew do
  it "should have a DOT constant" do
    expect(subject.const_get("DOT")).to eq "."
  end

  it "should have a DOT_GIT constant" do
    expect(subject.const_get("DOT_GIT")).to eq ".git"
  end

  it "should have a EMPTY_STRING constant" do
    expect(subject.const_get("EMPTY_STRING")).to eq ""
  end

  it "should have a STAR constant" do
    expect(subject.const_get("STAR")).to eq "*"
  end

  it "should have a NOT_FOUND constant" do
    expect(subject.const_get("NOT_FOUND")).to eq "NOT FOUND"
  end

  it "should have a FILES_TO_SEARCH_REGEXP constant" do
    expect(subject.const_get("FILES_TO_SEARCH_REGEXP")).to eq(/(CHANGE|CHANGES|CHANGELOG|NEWS|HISTORY)/i)
  end
end
