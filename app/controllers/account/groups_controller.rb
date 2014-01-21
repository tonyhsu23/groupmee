class Account::GroupsController < ApplicationController
	before_action :login_required

	def index
		@groups = current_user.participated_groups.count_order
	end

end
