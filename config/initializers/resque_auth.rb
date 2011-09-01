Resque::Server.use(Rack::Auth::Basic) do |user, password|
  
  "$2a$10$v8xObseXNyjTgSpAWDQFDupX6Px1b8xxPylZQOBq2n9ZOom37fg5C" == BCrypt::Engine.hash_secret(password, "$2a$10$v8xObseXNyjTgSpAWDQFDu")
  
end