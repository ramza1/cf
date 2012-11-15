class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, Blog, ["published_at <= ?", Time.zone.now] do |blog|
        blog.published_at <= Time.now.utc
      end
      can :read, Style
      can :read, FunctionalFashionDesigner
      can :read, FunctionalFashion, ["published_at <= ?", Time.zone.now] do |functional_fashion|
        functional_fashion.published_at <= Time.now.utc
      end
      can :read, LookBook, ["published_at <= ?", Time.zone.now] do |look_book|
        look_book.published_at <= Time.now.utc
      end
      can :read, Redcarpet, ["published_at <= ?", Time.zone.now] do |rc|
        rc.published_at <= Time.now.utc
      end
      can :read, Feature, ["published_at <= ?", Time.zone.now] do |fc|
        fc.published_at <= Time.now.utc
      end
      can :read, Fashion
      can :read, Runway
      can :read, FashionJury, ["published_at <= ?", Time.zone.now] do |fj|
        fj.published_at <= Time.now.utc
      end
      can :read, Magazine, ["published_at <= ?", Time.zone.now] do |mag|
        mag.published_at <= Time.now.utc
      end
      can :read, Runway::Collection, ["published_at <= ?", Time.zone.now] do |c|
        c.published_at <= Time.now.utc
      end
      can :read, Tip, ["published_at <= ?", Time.zone.now] do |t|
        t.published_at <= Time.now.utc
      end
      can :read, MenFashion, ["published_at <= ?", Time.zone.now] do |mf|
        mf.published_at <= Time.now.utc
      end
      can :read, TrendSpotting, ["published_at <= ?", Time.zone.now] do |ts|
        ts.published_at <= Time.now.utc
      end
      can :read, Video, ["published_at <= ?", Time.zone.now] do |v|
        v.published_at <= Time.now.utc
      end
    end
  end
end
