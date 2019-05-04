class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum status: {Public: 1, Pending: 0}

  POST_PARAMS = [:title, :content, :picture, :status].freeze

  validate  :picture_size
  validates :title, presence: true, length: {maximum: Settings.max_string_length}
  validates :content, presence: true, length: {minimum: Settings.min_text_length}

  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > Settings.size_picture.megabytes
      errors.add(:picture, I18n.t(".should_be_less_than_5MB"))
    end
  end
end
