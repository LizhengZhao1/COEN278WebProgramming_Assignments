
def filter_advisor(file_name)
    lines = File.readlines(file_name)
    flag = nil
    lines.each{ |line| # open the file
        ad_index = line =~ /^ADVISOR.*/ # find the Advisor start index
        if ad_index != nil
            flag = ad_index
        end
        stu_index = line =~ /^STUDENT.*/ # find the stu_index
        if stu_index != nil
            flag = nil
        end
        if flag != nil
            puts "#{line}"
        end
    }
end