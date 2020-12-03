class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def profile?
  	is_owner?
  end

private

    def is_owner?
    user == record.user
  end
end
