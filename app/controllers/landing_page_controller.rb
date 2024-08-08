class LandingPageController < ApplicationController

  def home
    authorize :landing_page, :home?
    @note = Note.where({ author: User.find_by(username: "jt") }).at(2)
  end

end
