class Update < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  scope :order_reverse_desc, -> { order(created_at: :desc) }
  enum category: [:on_track, :late, :ahead_of_schedule]
end
