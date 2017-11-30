class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  def resas?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
