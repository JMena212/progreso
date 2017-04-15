class Update < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  enum category: [:on_track, :late, :ahead_of_schedule]
end
