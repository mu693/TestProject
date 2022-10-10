class AppointmentDatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
     
    end
  end

  def index?
    if user.present?
      user.admin? 
    end
  end

  def create?
    if user.present?
      user.admin?
    end
  end

  def update?
    if user.present?
      user.admin?
    end
  end

  def show?
    if user.present?
      user.admin? || user.patient?
    end
  end

  def destroy?
    if user.present?
      user.admin? 
    end
  end

end