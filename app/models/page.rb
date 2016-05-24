class Page < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :position, inclusion: { in: ["top_menu","right_menu"]}
  belongs_to :user
end
