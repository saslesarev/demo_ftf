require 'rails_helper'

RSpec.describe "challenges/index", type: :view do
  before(:each) do
    assign(:challenges, [
      Challenge.create!(
        name: "Name",
        description: "MyText",
        status: 1,
        tasks_attributes: [{
          flag: "MyFlag1",
          question: "MyQuestion1"
        }]
      ),
      Challenge.create!(
        name: "Name",
        description: "MyText",
        status: 1,
        tasks_attributes: [{
          flag: "MyFlag1",
          question: "MyQuestion1"
        }]
      ),
      Challenge.create!(
        name: "Name",
        description: "MyText",
        status: 0,
        tasks_attributes: [{
          flag: "MyFlag1",
          question: "MyQuestion1"
        }]
      )
    ])
  end

  it "renders a list of challenges" do
    render
    assert_select "p a", text: "Name".to_s, count: 2
    assert_select "s a", text: "Name".to_s, count: 1
  end
end
