class LandingPageController < ApplicationController

  def index
    authorize :landing_page, :index?
    @note = Note.where({ author: User.find_by(username: "jt") }).at(2)
  end

end
