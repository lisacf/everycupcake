module ApplicationHelper
	def full_title(page_title)
		base_title = "Cupcake"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def link_to_add_fields(name, f, association, partial, htmlclass)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(partial.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: "#{htmlclass}", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def render_stars(rating)
		StarRenderer.new(rating, self).render_stars
	end

	def markdown(text)
		redcarpetmarkdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
			:autolink => true, :space_after_headers => true, :hard_wrap => true, :filter_html=>true, :highlight=> true,
			:quote => true)
		redcarpetmarkdown.render(text).html_safe
	end
end
