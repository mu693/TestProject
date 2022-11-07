class PatientAppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve; end
  end

  def index?
    return unless user.present?

    user.admin? || user.patient? || user.doctor?
  end

  def create?
    return unless user.present?

    user.patient?
  end

  # def update?
  #   if user.present?
  #     user.patient?
  #   end
  # end

  def show?
    return unless user.present?

    user.admin? || user.patient? || user.doctor?
  end

  def destroy?
    return unless user.present?

    user.admin? || user.patient? || user.doctor?
  end
end
