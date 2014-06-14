class User < ParseUser

  fields :email, :password, :username, :first_name, :last_name
  field :avatar, type: File

  validates_presence_of :email, :username, :first_name, :last_name, :password

end