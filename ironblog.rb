
# IRON BLOG
require 'colorize'
require 'date'

class Post
	attr_reader :title, :date, :text, :sponsored
	def initialize(title, date, text, sponsored = false)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

class Blog
	attr_reader :posts
	def initialize
		@posts = []
		@page = 1
		@page_posts=[]
	end
	
	def add_post(post)
		@posts.push(post)
	end

	def publish_front_page
		order_post_by_date
		#page_posts_creator
		puts @page_posts
		@posts.each do |post|
			puts (post.sponsored)? "******** #{post.title} ********" : post.title.colorize(:yellow)
			puts "*************"
			puts post.text
			puts "-------------".colorize(:red)
		end
	end

	def order_post_by_date	
		@posts.sort! { |a,b| DateTime.parse(b.date) <=> DateTime.parse(a.date) }
	end
	
	def page_posts_creator
		@page = @posts.each_slice(3).to_a

	end
end


blog = Blog.new
blog.add_post Post.new("Post title 1", "20/08/2016","Post 1 text")
blog.add_post Post.new("Post title 2", "23/07/2016","Post 2 text", true)
blog.add_post Post.new("Post title 3", "13/06/2016","Post 3 text")
blog.add_post Post.new("Post title 4", "10/05/2016","Post 4 text")
blog.add_post Post.new("Post title 5", "12/04/2016","Post 5 text")
blog.add_post Post.new("Post title 6", "13/03/2016","Post 6 text")
blog.add_post Post.new("Post title 7", "23/02/2016","Post 7 text", true)
blog.add_post Post.new("Post title 8", "13/01/2016","Post 8 text")

blog.publish_front_page

puts "\n"
