require 'rails_helper'

RSpec.describe Challenge, type: :model do
  subject {Challenge.create(name: 'C1', description: 'description one', status: 1, tasks_attributes: [{flag: 'Flag1', question: 'task1'},{flag: 'flag2', question: 'task2'}])}

  it 'Challenge check wrong flag' do 
    expect(subject.check_flag('flag2')).to be false
  end
  it 'Challenge check correct flag' do 
    expect(subject.check_flag('Flag1')).to be true
  end
  it 'Challenge check correct flag(without register)' do 
    expect(subject.check_flag('flag1')).to be true
  end

  it 'Challenge check solve for two tasks' do 
    expect(subject.tasks.solved.count).to eq(0)
    expect(subject.solve!('Flag1')).to be true
    expect(subject.tasks.solved.count).to eq(1)
    expect(subject.solve!('flag1')).to be false
  end

end
