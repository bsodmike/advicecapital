class PagesController < ApplicationController

  def index
    @page_title = "Advice Capital A/S - Index"
  end

  def contact
    @page_title = "Advice Capital A/S - Contact"
  end

  def about_ac
    @page_title = "Om Advice Capital"
  end

  def about_ai
    @page_title = "Om Advice Invest"
  end

end
