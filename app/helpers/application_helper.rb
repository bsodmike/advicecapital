module ApplicationHelper
	def show_link(object, content = "Show")
	  link_to(content, object) if can?(:read, object)
	end

	def edit_link(object, content = "Edit")
	  link_to(content, [:edit, object]) if can?(:update, object)
	end

	def destroy_link(object, content = "Destroy")
	  link_to(content, object, :method => :delete, :confirm => "Are you sure?") if can?(:destroy, object)
	end

	def create_link(object, content = "New")
	  if can?(:create, object)
	    object_class = (object.kind_of?(Class) ? object : object.class)
	    link_to(content, [:new, object_class.name.underscore.to_sym])
	  end
	end

	def current_investor(user_id)
  	Investor.where(:user_id => user_id)
  end


  # def link_to_remove_fields(name, f)
  #   f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  # end
  
  # def link_to_add_fields(name, f, association)
  #   new_object = f.object.class.reflect_on_association(association).klass.new
  #   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #     render(association.to_s.singularize + "_fields", :f => builder)
  #   end
  #   link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  # end	

end