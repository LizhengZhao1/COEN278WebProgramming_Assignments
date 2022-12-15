#!/usr/bin/ruby

require_relative 'q1'
require_relative 'q2'
require_relative 'q3'
require_relative 'q4'

puts "Question1:"

puts "1 1 1 2".count_word("1");
str1 = %{two, three, two, three, one, three, three}
puts str1.count_word();
puts str1.count_word("three");
str2 = <<EOS 
Facebook and its founder must release documents and electronic 
correspondence to a defense lawyer whose client has fled from criminal 
charges that he falsely claimed a majority ownership in the social media 
giant, a federal judge said Friday.
EOS
puts str2.count_word("and");


puts "Question2:"

obj = Compress.new("i love you but do you love me")
p obj.words, obj.seq
puts obj.uncompress();

puts "Question3:"

str = <<EOF
<%= simple_form_for @project do |f| %> 
    <%= f.input :name %> 
    <%= f.input :description %> 
    <h3>Tasks</h3> 
    <div id='tasks'> 
      <%= f.simple_fields_for :tasks do |task| %> 
        <%= render 'task_fields', :f => task %> 
      <% end %> 
      <div class='links'> 
        <%= link_to_add_association 'add task', f, :tasks %> 
      </div> 
    </div> 
    <%= f.submit 'Save' %> 
<% end %> 
EOF

obj = Webpage.new(str)
puts obj.filter


puts "Question4:"

filter_advisor("conversation.txt")
