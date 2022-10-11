class Diary
    def initialize
        @all_entries = []
        @my_tasks = Todo_List.new()
    end

    def add_entry(entry)
        @all_entries << entry
    end

    def read_all
        @all_text = []
        @all_entries.each do |entry|
            @all_text << entry.text
        end
        return @all_text
    end

    def what_can_I_read?(wpm, minutes)
        suitable_texts = []
        suitable_entry = @all_entries.filter do |entry|
            entry.reading_time(wpm) <= minutes
        end
        suitable_entry.each do |item|
            suitable_texts << item.text
        end
        ordered = suitable_texts.sort_by {|x| x.length}
        return ordered.last
    end

    def phone_nums
        all_nums = []
        @all_entries.each do |entry|
            all_nums.concat(entry.phone)
        end
        return all_nums
    end

    def incomplete_tasks
        return @my_tasks.incomplete
    end

    def add_task(text)
        return @my_tasks.add(text)
    end

    def task_completed!(text)
        return @my_tasks.done!(text)
    end

    def all_completed
        return @my_tasks.completed()
    end

    def task_delete(text)
        return @my_tasks.delete(text)
    end
end
