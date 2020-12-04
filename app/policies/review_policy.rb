class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !is_owner?
  end

  private


  def is_owner?
    user == record.user
  end

end
