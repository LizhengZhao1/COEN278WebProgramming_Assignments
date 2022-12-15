class Compress
    attr_accessor :seq, :words
    def initialize(str)
        @words_hash = {}
        @seq = []
        @words = []
        str.split(/\W/).each {|w| 
            if not @words_hash[w]
                @words_hash[w] = @words_hash.size
                @words << w         # ordered, no need to worry unstable index
            end
            @seq << @words_hash[w]
        }
    end

    def uncompress()
        uncompressed = ""
        size = @seq.size
        for i in 0..size-1
            index = @seq[i]
            if(i != size-1)
                uncompressed << @words[index]
                uncompressed << " "
            else uncompressed << @words[index]
            end
        end
        return uncompressed
    end
end
