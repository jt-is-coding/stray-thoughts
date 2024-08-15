class LandingPageController < ApplicationController

  def index
    authorize :landing_page, :index?
    
    if Note.where({ parent: Game.find_by(api_id: "69675") }).first == nil
      @note = Note.where({ author: User.find_by(username: "jt") }).sample
    else
      @note = Note.where({ parent: Game.find_by(api_id: "69675") }).first
    end
  end

end
