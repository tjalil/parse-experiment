class User < ParseUser
  fields :email, :password, :username, :first_name, :last_name, :role, :organization_name, :type_of_artist
end
