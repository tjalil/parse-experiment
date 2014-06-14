class TeamsController < ApplicationController
  
  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)

    if params[:team][:team_photo]
      result = Team.upload(params[:team][:team_photo].tempfile, params[:team][:team_photo].original_filename, content_type: params[:team][:team_photo].content_type)
      @team.team_photo = {"__type"=>"File", "name"=>result['name'], "url"=>result['url']}
    end

    @team.owner_id = current_user.id
    @team.owner = current_user
    if @team.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :team_photo)
  end

end
