# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  excerpt    :text
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_slug       (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Post < ApplicationRecord
  extend FriendlyId

  friendly_id  :title, use: :slugged

  has_rich_text :body
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true

  validate :has_attached_image?

  validates_length_of :excerpt, maximum: 150

  scope :published, -> { where(draft: false).order(created_at: :desc) }

  scope :latest_published, -> { where(draft: false).order(created_at: :desc).limit(3) }

  def reading_time
    return 0 if body.blank?
    words_per_minute = 150
    text = Nokogiri::HTML(self.body.body.to_html).at('body').inner_text
    (text.scan(/\w+/).length / words_per_minute).to_i
  end

  def has_attached_image?
    if !image.attached?
      errors.add(:image, 'You must upload an image.')
    end
  end
end
