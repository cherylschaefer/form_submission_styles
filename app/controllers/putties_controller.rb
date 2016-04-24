class PuttiesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @putty = Putty.find(params[:id])
  end

  def update
    @putty = Putty.find(params[:id])
    if @putty.update(putty_params)
      redirect_to root_path, notice: "Putty updated"
    else
      flash[:notice] = "Something went wrong"
      render 'edit'
    end
  end

  private
  def putty_params
    params.require(:putty).permit(:name)
  end
end
