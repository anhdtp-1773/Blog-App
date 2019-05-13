class Follow < ActiveRecord::Base

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  # NOTE: Follows belong to the "followable" and "follower" interface
  belongs_to :followable, polymorphic: true
  belongs_to :follower,   polymorphic: true

  scope :follower_id, ->(id){where(followable_id: id).pluck :follower_id}

  def block!
    self.update_attribute(:blocked, true)
  end

end
