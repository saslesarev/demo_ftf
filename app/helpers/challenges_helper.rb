module ChallengesHelper
    def print_current_task text
        content_tag :div, simple_format(text), class: 'current-task'
    end
end
