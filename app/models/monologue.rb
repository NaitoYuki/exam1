class Monologue < ActiveRecord::Base
  validates :content, presence: true, length: { in: 0..140 }
end
