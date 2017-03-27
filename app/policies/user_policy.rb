class UserPolicy < ApplicationPolicy
  def update?
    is_owner? || is_admin?
  end

  def create?
    true
  end

  def destroy?
    is_admin?
  end

private
  def is_owner?
    user && user.id == record.id
  end
end
