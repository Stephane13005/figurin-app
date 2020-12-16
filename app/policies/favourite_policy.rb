class FavouritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def favorite?
    true
  end

  def destroy?
    record.user == user
  end
end
