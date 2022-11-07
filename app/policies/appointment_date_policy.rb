class AppointmentDatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve; end
  end

  def index?
    return unless user.present?

    user.admin? || user.doctor?
  end

  def create?
    return unless user.present?

    user.doctor?
  end

  def update?
    return unless user.present?

    user.doctor?
  end

  def show?
    return unless user.present?

    user.admin? || user.doctor? || user.patient?
  end

  def destroy?
    return unless user.present?

    user.doctor?
  end
end
