class DiaryEntry
    def initialize(text)
        @text = text
        @len = @text.split.length
    end

    def text
        return @text
    end

    def phone
        @numbers = []
        @text_list = @text.split
        @text_list.each do |word|
            if word =~ /\d{11}/
                cleaned = word.scan(/\d/).join
                @numbers << cleaned
            end
        end
        return @numbers
    end

    def reading_time(wpm)
        return @len/wpm
    end
end