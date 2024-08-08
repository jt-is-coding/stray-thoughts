class SearchPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end
  
  def search_home?
    user != nil
  end

  def search_results?
    search_home?
  end

end
