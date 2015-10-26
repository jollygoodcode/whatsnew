RSpec.describe Whatsnew do
  it "should have a EMPTY_STRING constant" do
    expect(subject.const_get("EMPTY_STRING")).to eq ""
  end

  it "should have a NOT_FOUND constant" do
    expect(subject.const_get("NOT_FOUND")).to eq "NOT FOUND"
  end
end
