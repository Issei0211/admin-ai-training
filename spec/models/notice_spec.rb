require "rails_helper"

RSpec.describe Notice, type: :model do
  it "タイトルと本文がある場合は有効であること" do
    notice = described_class.new(title: "Title", body: "Body")

    expect(notice).to be_valid
  end

  it "タイトルがない場合は無効であること" do
    notice = described_class.new(body: "Body")

    expect(notice).not_to be_valid
    expect(notice.errors[:title]).to include("can't be blank")
  end

  it "本文がない場合は無効であること" do
    notice = described_class.new(title: "Title")

    expect(notice).not_to be_valid
    expect(notice.errors[:body]).to include("can't be blank")
  end
end
