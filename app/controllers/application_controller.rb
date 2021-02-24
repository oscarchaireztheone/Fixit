class ApplicationController < ActionController::Base
	def working
		list = Rep.where(:working => true)
    @working = list.count

	end
end
