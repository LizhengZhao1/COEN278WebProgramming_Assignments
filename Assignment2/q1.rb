class String
    def count_word(word = "")
        count = {}
        self.split(/\W+/).each{ |w| #split from all "not words" chars
            if count[w]
                count[w] += 1
            else 
                count[w] = 1
            end
        }

        #return accoding to word
        if(word != "")
            return count[word] || 0;
        else return count
        end
    end
end