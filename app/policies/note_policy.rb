class NotePolicy < ApplicationPolicy
  attr_reader :user, :note

  def initialize(user, note)
    @user = user
    @note = note
  end
  
  def index?
    user != nil
  end
  
  def new?
    index?
  end
  
  def create?
    index?
  end
  
  def show?
    user == note.author
  end

  def edit?
    show?
  end

  def destroy?
    show?
  end

  def update?
    show?
  end

end
