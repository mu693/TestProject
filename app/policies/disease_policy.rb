class DiseasePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve; end
  end

  def index?
    return unless user.present?

    user.admin? || user.patient?
  end

  def create?
    return unless user.present?

    user.admin?
  end

  def update?
    return unless user.present?

    user.admin?
  end

  def show?
    return unless user.present?

    user.admin? || user.patient?
  end

  def destroy?
    return unless user.present?

    user.admin?
  end
end
