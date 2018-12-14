require 'rails_helper'

RSpec.describe "postings/show", type: :view do
  before(:each) do
    @posting = assign(:posting, Posting.create!(
      :user => nil,
      :meteorite => nil,
      :weight => 2.5,
      :cost => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
  end
end
