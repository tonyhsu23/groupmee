class Group < ActiveRecord::Base
	
	validates :title, :presence => true

	has_many :posts, dependent: :destroy
	has_many :group_users
	belongs_to :owner, :class_name => "User", :foreign_key => :user_id
	has_many :members, :through => :group_users, :source => :user

	scope :count_order, -> { order("posts_count ASC") }

	after_create :join_owner_to_group

	def editable_by?(user)
		user && user == owner
	end

	def join_owner_to_group
		members << owner
	end

end
