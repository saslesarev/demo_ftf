class Challenge < ApplicationRecord
    enum status: {draft: 0, published: 1, solved: 2}
    
    has_many :tasks, dependent: :delete_all, inverse_of: :challenge

    accepts_nested_attributes_for :tasks

    validates :name, presence: :true
    validates :tasks, length: {minimum: 1}
    
    def current_task
        tasks.not_solved.first
    end

    def solve! flag
        if check_flag(flag)
            if current_task.update_attribute(:solved, true)
                solved! if tasks.not_solved.empty?
            end
            true
        else
            false
        end
    end

    def check_flag flag
        return false unless current_task
        current_task.flag.casecmp(flag) == 0
    end
end
