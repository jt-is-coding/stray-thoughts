class LandingPageController < ApplicationController

  def home
    @note = Note.where({ author: User.find_by(username: "jt") }).at(2)
  end

end
