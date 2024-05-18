class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_diaries, through: :favorites, source: :diary

  has_one_attached :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @diary = Diary.where("description LIKE?","#{word}")
    elsif search == "forward_match"
      @diary = Diary.where("description LIKE?","#{word}%")
    elsif search == "backward_match"
      @diary = Diary.where("description LIKE?","%#{word}")
    elsif search == "partial_match"
      @diary = Diary.where("description LIKE?","%#{word}%")
    else
      @diary = Diary.all
    end
  end
end
