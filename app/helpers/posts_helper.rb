module PostsHelper
	def render_post_content(post)
		auto_link(truncate(simple_format(post.content), :length => 100))
	end
end
