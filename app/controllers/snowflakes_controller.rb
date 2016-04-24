class SnowflakesController < ApplicationController
    before_action :authenticate_user!

  def new
    @snowflake = Snowflake.new
  end

  def create
    @snowflake = Snowflake.new(snowflake_params.merge(user: current_user))
    if @snowflake.save
      redirect_to root_path, notice: "Snowflake created"
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @snowflake = Snowflake.find(params[:id])
    @snowflake.destroy
    redirect_to root_path
  end

  private
  def snowflake_params
    params.require(:snowflake).permit(:name)
  end
end
