class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  validates :comment, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'imagge/jpeg')
    else
      image
    end
  end
end
