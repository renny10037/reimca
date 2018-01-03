class StackCity < ActiveRecord::Base
	has_one :work
	belongs_to :stack_state
end
