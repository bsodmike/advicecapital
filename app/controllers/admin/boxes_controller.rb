class Admin::BoxesController < AdminController

  def show
    @box = Box.find(params[:id])
  end

  def edit
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])

    if @box.update_attributes(params[:box])
      redirect_to(@box, :notice => "Boxen blev opdateret")
    else
      render :edit
    end
  end

end
