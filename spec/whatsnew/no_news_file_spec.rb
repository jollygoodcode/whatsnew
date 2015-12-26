RSpec.describe Whatsnew::NoNewsFile do
  let(:subject) { Whatsnew::NoNewsFile.new }

  it "responds to these messages" do
    expect(subject).to respond_to :file_name
    expect(subject).to respond_to :content
    expect(subject).to respond_to :file_url
    expect(subject).to respond_to :read
  end
end
