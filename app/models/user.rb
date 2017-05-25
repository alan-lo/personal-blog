class User < ApplicationRecord
attr_accessor :reset_token

has_many :posts, dependent: :nullify
has_many :comments, dependent: :nullify

has_many :likes, dependent: :destroy
has_many :liked_posts, through: :likes, source: :post

mount_uploader :avatar, AvatarUploader

validate :avatar_upload_size

has_secure_password

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

validates :email, presence: true,
                  uniqueness: true,
                  format: VALID_EMAIL_REGEX

  # Sets the password reset attributes.
  def create_reset_digest
    @reset_token = SecureRandom.urlsafe_base64(48)
    self.reset_token = @reset_token
    update_attribute(:reset_digest,  @reset_token)
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def avatar_upload_size
    if avatar.size > 0.5.megabytes
      errors.add(:base, "Avatar should be less than 0.5MB")
    end
  end
end
