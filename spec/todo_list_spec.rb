require 'todo_list'

RSpec.describe Todo_List do
    context "When I put an item in the todo list" do
        it "it is stored as an incomplete item" do
            todo = Todo_List.new()
            todo.add("Mow the grass")
            result = todo.incomplete()
            expect(result).to eq ["Mow the grass"]
        end
    end
    context "When I put multiple items in the todo list" do
        it "they are stored as an incomplete items" do
            todo = Todo_List.new()
            todo.add("Mow the grass")
            todo.add("Trim the hedge")
            result = todo.incomplete()
            expect(result).to eq ["Mow the grass", "Trim the hedge"]
        end
    end
    context "When there are no items in completed" do
        it "no items are returned when complete called" do
            todo = Todo_List.new()
            todo.add("Mow the grass")
            todo.add("Trim the hedge")
            result = todo.completed()
            expect(result).to eq []
        end
    end
    context "When there a task is completed" do
        it "only completed items are returned when complete called" do
            todo = Todo_List.new()
            todo.add("Mow the grass")
            todo.add("Trim the hedge")
            todo.done!("Trim the hedge")
            result = todo.completed()
            expect(result).to eq ["Trim the hedge"]
        end
    end
    context "When I use the delete method on an task" do
        it "task is removed from todo list" do
            todo = Todo_List.new()
            todo.add("Mow the grass")
            todo.add("Trim the hedge")
            todo.delete("Trim the hedge")
            result = todo.incomplete()
            expect(result).to eq ["Mow the grass"]
        end
    end
end


