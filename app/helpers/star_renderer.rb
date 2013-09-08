class StarRenderer
	def initialize(rating, template)
		@rating = rating
		@template = template
	end

	def render_stars
		content_tag :div, star_images.html_safe, :class => 'stars'
	end

	def star_images
		if @rating.nil?
			(0...5).map {|star| star_image(0) }.join
		else
			(0...5).map do |position|
				star_image(((@rating-position)*2).round)
			end.join
		end
	end

	def star_image(value)
		image_tag "/assets/#{star_type(value)}_star30.png"
	end

	def star_type(value)
		if value <= 0
			'empty'
		elsif value == 1
			'half'
		else
			'full'
		end
	end

	def method_missing(*args, &block)
		@template.send(*args, &block)
	end
end