class LandingPageController < ApplicationController

  def home
    @note = Note.find_by(author_id: User.find_by(username: "jt"))
  end

end
