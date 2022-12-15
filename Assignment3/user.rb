require 'dm-core'
require 'dm-migrations'

configure :development, :test do
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/user.db")
  end
  
configure :production do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
end

# DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/user.db")

class User #there is going to be a table called 'users'
    include DataMapper::Resource
    property(:id, Serial) #Serial-automincrement primary key
    property(:username, String) 
    property(:password, String)
    property(:totalWin, Integer)
    property(:totalLoss, Integer)
    property(:totalProfit, Integer)
end

DataMapper.finalize

