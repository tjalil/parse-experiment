class User < ParseUser
  fields :email, :password, :username, :first_name, :last_name, :role, :organization_name, :type_of_artist

  validates_presence_of :email, :username, :first_name, :last_name, :password
end