class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  enum status: {Public: 1, Pending: 0}

  scope :acive_status, ->{where status: Settings.status_active}
  scope :get_attr, ->{select :id, :title, :body}
  scope :other_entries, ->(id){acive_status.where.not id: id}
  scope :user_entries, ->(id){where user_id: id}
  scope :all_entries, ->{acive_status.get_attr.order created_at: :desc}
  scope :by_lastest, ->{order created_at: :desc}

  ENTRY_PARAMS = [:title, :body, :image, :status, :user_id].freeze

  validates :user_id, :presence => true
  validates :image, presence: true
  validates :title, presence: true, length: {maximum: Settings.max_string_length}
  validates :body, presence: true, length: {minimum: Settings.min_text_length}
end
