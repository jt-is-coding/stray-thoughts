class LandingPageController < ApplicationController

  def index
    authorize :landing_page, :index?
    
    if Note.find_by(parent: Game.find_by(api_id: "69675")) == nil
      @note = Note.all.sample
    else
      @note = Note.find_by(parent: Game.find_by(api_id: "69675").find_by(username: "jt"))
    end
  end

end
