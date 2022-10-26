class AppointmentDatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
     
    end
  end

  def index?
    if user.present?
      user.admin? || user.doctor? 
    end
  end

  def create?
    if user.present?
      user.doctor?
    end
  end

  def update?
    if user.present?
      user.doctor?
    end
  end

  def show?
    if user.present?
      user.admin? || user.doctor? || user.patient?
    end
  end

  def destroy?
    if user.present?
      user.doctor? 
    end
  end

end