class Todo < ApplicationRecord
  validates :title, presense: true
end
