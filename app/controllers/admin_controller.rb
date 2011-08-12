class AdminController < ApplicationController
  before_filter :signed_in_user, :only => [:index]

  def index
    @page_title = "Admin"
  end
end
