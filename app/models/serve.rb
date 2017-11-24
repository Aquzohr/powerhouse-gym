class Serve < ApplicationRecord
	belongs_to :member, optional: true
end
