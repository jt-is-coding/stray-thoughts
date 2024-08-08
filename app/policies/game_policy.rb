class GamePolicy < ApplicationPolicy
  attr_reader :user, :game

  def initialize(user, game)
    @user = user
    @game = game
  end

  def index?
    false
  end

  def show?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def new?
    user != nil
  end

  def create?
    new?
  end

end
