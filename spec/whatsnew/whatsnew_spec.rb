RSpec.describe Whatsnew do
  it "should have a VERSION constant" do
    expect(subject.const_get("VERSION")).not_to be_empty
  end

  describe ".about" do
    it "returns project" do
      expect(Whatsnew::Project).to receive(:new).and_return spy

      Whatsnew.about "."
    end
  end
end
