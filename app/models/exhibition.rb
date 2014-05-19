class Exhibition < ActiveRecord::Base
	belongs_to :piece
	belongs_to :event


end
