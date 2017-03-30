class CompanyPolicy < ApplicationPolicy
  def update?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
