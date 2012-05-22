class BoardsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @boards = Board.all
  end

  def show
    @board = get_board
  end

  def new
    @board = Board.new
  end

  def edit
    @board = get_board
  end

  def create
    @board = Board.new(params[:board])

    if @board.save
      redirect_to @board, :notice => 'Board was successfully created.'
    else
      render :new
    end
  end

  def update
    @board = get_board

    if @board.update_attributes(params[:board])
      redirect_to @board, :notice => 'Board was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @board = get_board
    @board.destroy
  end
  
  private
  def get_board
    Board.find(params[:id])
  end
end
