class Admin::BoxesController < AdminController
	load_and_authorize_resource

  def index
    @boxes = Box.all#(:conditions => ["name != ?", "frontpage_video"])
  end

  def show
    @box = get_box(params[:id])
  end

  def edit
    @box = get_box(params[:id])
  end

  def update
    @box = get_box(params[:id])

    if @box.update_attributes(params[:box])
      redirect_to admin_boxes_url, :notice => "Boxen blev opdateret"
    else
      render :edit
    end
  end
  
  private
  def get_box(box_id)
    Box.find(box_id)
  end

end