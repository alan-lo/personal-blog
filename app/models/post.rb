class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes ,dependent: :destroy
  has_many :likers ,through: :likes, source: :user

  validates :title ,presence: true
  validates :body , presence: true

  mount_uploader :image, PostImgUploader
  validates :post_img_upload_size

  def liked_by?(user)
  # exists? returns true if the query in the argument returns something
  # it returns true if there is a like with the user reference 'user'
  likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end

  def getLikeCounts()
    likes.count
  end

  def post_img_upload_size
    if image.size > 5.megabytes
      errors.add(:base, "Your image should be less than 5MB")
    end
  end

end
