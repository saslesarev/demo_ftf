require 'rails_helper'

RSpec.describe "challenges/show", type: :view do
  before(:each) do
    @challenge = assign(:challenge, Challenge.create!(
      name: "Name",
      description: "MyText",
      status: 0,
      tasks_attributes: [
        {flag: 'Flag1', question: 'QestionText1'}
      ]
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
