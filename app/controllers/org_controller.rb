class OrgController < ApplicationController
  def index
    @employees = Employee.find(:all)
  end
end
