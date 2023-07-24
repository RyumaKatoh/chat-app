class Messagee < ApplicationRecord
end
class Messagee < ApplicationRecord
  belongs_to :room
  belongs_to :user
end