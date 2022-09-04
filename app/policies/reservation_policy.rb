class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    if user.methods.include?(:admin)
      user.admin? || record.user == user 
    else
      record.user == user 
    end
  end

  def destroy?
    if user.methods.include?(:admin)
      user.admin? || record.user == user 
    else
      record.user == user 
    end
  end

end
