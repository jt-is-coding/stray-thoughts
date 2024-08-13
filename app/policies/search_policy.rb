class SearchPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end
  
  def index?
    user != nil
  end

end
