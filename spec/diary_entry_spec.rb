require "diary_entry"

RSpec.describe DiaryEntry do
    context "When I create a diary entry" do
        it "an entry object is created" do
            entry1 =  DiaryEntry.new("Dear Diary, this is the first time I am writing here.")
            result = entry1.text()
            expect(result).to eq "Dear Diary, this is the first time I am writing here."
        end
    end
    context "When I check for a phone number in entry" do
        it "any numbers of 11 digits are returned" do
            entry1 =  DiaryEntry.new("Dear Diary, this is the first this time I am writing here 0755512. My new number is 07555123456")
            result = entry1.phone()
            expect(result).to eq ["07555123456"]
        end
    end
    context "When I check for estimated reading time with a word per minute input" do
        it "an integer of the est reading time is returned" do
            entry1 =  DiaryEntry.new("Dear Diary, this is the first time I am writing here. My new number is 07555123456")
            result = entry1.reading_time(2)
            expect(result).to eq 8
        end
    end
end

