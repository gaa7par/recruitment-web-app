class UserPolicy < ApplicationPolicy
  def destroy?
    user.admin? && !record.admin?
  end
end
