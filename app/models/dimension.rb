class Dimension < ActiveRecord::Base
  belongs_to :fact
  has_many :measurements
end
