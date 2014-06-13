class Team < ParseResource::Base

  fields :team_name, :owner_id
  field :team_photo, type: File

  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'

end
