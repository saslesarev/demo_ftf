require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ChallengesHelper. For example:
#
# describe ChallengesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ChallengesHelper, type: :helper do
  it 'display the current task' do
    text = 'task text'
    expect(print_current_task(text)).to match /.*class="current-task".*#{text}/
  end
end
