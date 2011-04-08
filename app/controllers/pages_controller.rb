class PagesController < ApplicationController

  def index
    @page_title = "Advice Capital A/S - Index"
  end

  def contact
    @page_title = "Advice Capital A/S - Contact"
  end

end
