class AdminPolicy < ApplicationPolicy
  def show?
    user.admin?
  end
end
