class HomePolicy < ApplicationPolicy
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

end