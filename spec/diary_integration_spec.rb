require 'diary'
require 'todo_list'
require 'diary_entry'


RSpec.describe Diary do
    context 'when entry added' do
        it 'entry is stored in diary' do
            diary1 = Diary.new()
            entry1 = DiaryEntry.new("This is the very first time I have written a diary.")
            diary1.add_entry(entry1)
            result = diary1.read_all()
            expect(result).to eq ["This is the very first time I have written a diary."]
        end
    end
    context "when 'read_all' requested" do
        it 'return all entry texts' do
            diary1 = Diary.new()
            entry1 = DiaryEntry.new("This is the very first time I have written a diary.")
            entry2 = DiaryEntry.new("This is the second time I have written a diary.")
            entry3 = DiaryEntry.new("This is the third time I have written a diary.")
            diary1.add_entry(entry1)
            diary1.add_entry(entry2)
            diary1.add_entry(entry3)
            result = diary1.read_all()
            expect(result).to eq ["This is the very first time I have written a diary.","This is the second time I have written a diary.", "This is the third time I have written a diary."]
        end
    end
    context "when 'what_can_I_read?' called with wpm and mins" do
        it 'return an entry that can be read in mins available' do
            diary1 = Diary.new()
            entry1 = DiaryEntry.new("This is the first.")
            entry2 = DiaryEntry.new("This is the second time I have written a diary.")
            entry3 = DiaryEntry.new("This is the third time I have written a diary and I am positively LOVING IT!")
            diary1.add_entry(entry1)
            diary1.add_entry(entry2)
            diary1.add_entry(entry3)
            result = diary1.what_can_I_read?(2, 5)
            expect(result).to eq "This is the second time I have written a diary."
        end
    end
    context "when 'phone_nums' requested" do
        it 'return all phone numbers in diary' do
            diary1 = Diary.new()
            entry1 = DiaryEntry.new("This is the first 07575123546.")
            entry2 = DiaryEntry.new("This is the second time 07575123554 I have written a diary.")
            entry3 = DiaryEntry.new("This is the third time 07575123778 have written a diary and I am positively LOVING IT!")
            diary1.add_entry(entry1)
            diary1.add_entry(entry2)
            diary1.add_entry(entry3)
            result = diary1.phone_nums()
            expect(result).to eq ['07575123546', '07575123554', '07575123778']
        end
    end
    context "when incomplete_tasks called"  do
        it 'return all incomplete todo items' do
            diary1 = Diary.new()
            result = diary1.incomplete_tasks()
            expect(result).to eq []
        end
    end
    context "when item added to todo list" do
        it 'item is added as incomplete' do
            diary1 = Diary.new()
            diary1.add_task("Hang out the washing")
            result = diary1.incomplete_tasks()
            expect(result).to eq ["Hang out the washing"]
        end
    end
    context "when item completed" do
        it 'item is marked as incomplete' do
            diary1 = Diary.new()
            diary1.add_task("Hang out the washing")
            diary1.task_completed!("Hang out the washing")
            result = diary1.all_completed()
            expect(result).to eq ["Hang out the washing"]
        end
    end
    context "when all_completed called"  do
        it 'return all complete todo items' do
            diary1 = Diary.new()
            diary1.add_task("Hang out the washing")
            diary1.task_completed!("Hang out the washing")
            diary1.add_task("Take a nap")
            diary1.task_completed!("Take a nap")
            result = diary1.all_completed()
            expect(result).to eq ["Hang out the washing", "Take a nap"]
        end
    end
    context "when task_delete called"  do
        it 'delete todo item indicated' do
            diary1 = Diary.new()
            diary1.add_task("Take a nap")
            diary1.add_task("Hang out the washing")
            diary1.task_delete("Take a nap")
            result = diary1.incomplete_tasks()
            expect(result).to eq ["Hang out the washing"]
        end
    end
end
