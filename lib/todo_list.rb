class Todo_List
    def initialize()
        @todo = []
    end

    def add(text)
        @todo << {'task'=> text, 'status'=> 'incomplete'}
    end

    def incomplete
        @incomplete = []
        @todo.each do |task|
            if task['status'] == 'incomplete'
                @incomplete << task['task']
            end
        end
        return @incomplete
    end

    def done!(text)
        @todo.each do |task|
            if task['task'] == text
                task['status'] = 'complete'
            end
        end
    end

    def completed
        @complete = []
        @todo.each do |task|
            if task['status'] == 'complete'
                @complete << task['task']
            end
        end
        return @complete
    end

    def delete(text)
        @todo.each do |task|
            if task['task'] == text
                @todo.delete(task)
            end
        end
    end

end