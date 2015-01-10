class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :username,
            presence: true,
            uniqueness: true,
            length: { in: 3..20 }
  validates :website, :allow_blank => true,
            format: {
              with: URI.regexp },
              if: Proc.new { |a| a.website.present?
            }
  validate :avatar_size_validation
  validates :avatar_link,
            allow_blank: true,
            format: {
              with: URI.regexp,
              with: /\A.*\.(png|gif|jpg|jpeg)/i,
              message: "is not a valid image format (jpg, gif, png)"
            },
            if: Proc.new { |a| a.website.present? }
  validates :role, presence: true, inclusion: { in: 0..1 }

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 1 MB" if avatar.size > 1.megabytes
  end
end
