class LandingPageController < ApplicationController

  def index
    authorize :landing_page, :index?
    @note = Note.where({ parent: Game.find_by(api_id: "69675") }).first
    #@note = Note.where({ author: User.find_by(username: "jt") }).sample
  end

end
