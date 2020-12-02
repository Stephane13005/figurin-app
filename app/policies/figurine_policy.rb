class FigurinePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def media?
    true
  end

  def profile?
    true
  end

  def buy?
    !is_owner?
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

  private

  def is_owner?
    user == record.user
  end
end
