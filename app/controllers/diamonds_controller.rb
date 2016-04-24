class DiamondsController < ApplicationController
  before_action :authenticate_user!

  def new
    @diamond = Diamond.new
  end

  def create
    @diamond = Diamond.new(diamond_params.merge(user: current_user))
    if @diamond.save
      redirect_to root_path, notice: "Diamond created"
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @diamond = Diamond.find(params[:id])
    @diamond.destroy
    redirect_to root_path
  end

  private
  def diamond_params
    params.require(:diamond).permit(:name)
  end
end
