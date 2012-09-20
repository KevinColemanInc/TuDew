class Ability
  include CanCan::Ability

  def initialize(user)
  
    can :manage, Category, :user_id => user.id
    
  end
end
