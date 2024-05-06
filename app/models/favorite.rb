class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :diary

  #validates_uniqueness_of :user_id, uniqueness: {scope: :diary_id}
  validates :user_id, uniqueness: {scope: :diary_id}
end
