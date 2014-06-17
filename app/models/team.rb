class Team < ParseResource::Base

  fields :team_name, :owner_id, :owner
  field :team_photo, type: File

end
