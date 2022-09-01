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
    if user.admin?
      true
    else
      user.id == record.user.id
    end
  end

  def destroy?
    if user.admin?
      true
    else
      user.id == record.user.id
    end
  end

end
