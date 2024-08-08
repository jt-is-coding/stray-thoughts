class SearchPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end
  
  def search_home?
    true
  end

end
