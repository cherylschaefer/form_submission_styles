class TribblesController < ApplicationController
  before_action :authenticate_user!

  def new
    @tribble = Tribble.new
  end

  def create
    @tribble = Tribble.new(tribble_params.merge(user: current_user))
    if @tribble.save
      redirect_to root_path, notice: "Tribble created"
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @tribble = Tribble.find(params[:id])
  end

  def update
    @tribble = Tribble.find(params[:id])
    if @tribble.update(tribble_params)
      redirect_to root_path, notice: "Tribble updated"
    else
      flash[:notice] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @tribble = Tribble.find(params[:id])
    @tribble.destroy
    redirect_to root_path
  end

  private
  def tribble_params
    params.require(:tribble).permit(:name)
  end
end
