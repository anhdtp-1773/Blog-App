class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  COMMENT_PARAMS = [:user_id, :content, :entry_id].freeze

  delegate :title, to: :entry, prefix: true
  delegate :name, to: :user, prefix: true

  scope :count_cmt, ->(entry_id){(where(entry_id: entry_id)).count}
  scope :by_lastest, ->{order created_at: :desc}
  scope :lastest_by_entry, ->(entry_id){(where(entry_id: entry_id)).order created_at: :desc}
end
