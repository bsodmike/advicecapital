class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.xml
  def index
    @employees = Employees.all
  end

  # GET /employees/1
  # GET /employees/1.xml
  #def show
   # @employee = Employee.find(params[:id])

    #respond_to do |format|
     # format.html # show.html.erb
      #format.xml  { render :xml => @employee }
    #end
  #end

  # GET /employees/new
  # GET /employees/new.xml
  def new
    @employees = Employees.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employees = Employees.find(params[:id])
  end

  # POST /employees
  # POST /employees.xml
  def create
    @employees = Employees.new(params[:employee])

    respond_to do |format|
      if @employees.save
        format.html { redirect_to(@employees, :notice => 'Employee was successfully created.') }
        format.xml  { render :xml => @employees, :status => :created, :location => @employees }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employees.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.xml
  def update
    @employees = Employees.find(params[:id])

    respond_to do |format|
      if @employees.update_attributes(params[:employees])
        format.html { redirect_to(@employees, :notice => 'Employee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employees.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.xml
  def destroy
    @employees = Employees.find(params[:id])
    @employees.destroy

    respond_to do |format|
      format.html { redirect_to(employees_url) }
      format.xml  { head :ok }
    end
  end
end
