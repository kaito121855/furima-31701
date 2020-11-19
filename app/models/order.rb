class Order < ApplicationRecord
has_one :residence
belongs_to :product
belongs_to :user
end
