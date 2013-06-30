class Dimension < ActiveRecord::Base
  belongs_to :fact
  belongs_to :user
  has_many :measurements
end
