class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = get_employee

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employee }
      format.json { render :json => @employee }
      format.pdf do
        pdf = EmployeePdf.new(@employee, view_context)
        send_data pdf.render, filename: "employee_#{@employee}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = get_employee
  end

  def create
    @employee = Employee.new(params[:employee])
    
    if @employee.save
      redirect_to @employee, :notice => 'Employee was successfully created.'
    else
      render :new
    end
  end

  def update
    @employee = get_employee

    if @employee.update_attributes(params[:employee])
      redirect_to(@employee, :notice => 'Employee was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @employee = get_employee
    @employee.destroy

    redirect_to employees_url
  end
  
  private
  def get_employee
    Employee.find(params[:id])
  end
end
