class EmployeePdf < Prawn::Document
	def initialize(employee)
		super(top_margin: 70)
		@employee = employee
		name
		title
	end

	def name
		text "Name \##{@employee.name}", size: 30, style: :bold
	end

	def title
		move_down 20
		text "Title \##{@employee.title}"
	end

end