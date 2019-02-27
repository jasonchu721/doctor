class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :destroy]
 
  def index
    @physicians = Physician.all
  end

  def show
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)

    if @physician.save
      redirect_to @physician
    else 
      render :new
    end
  end

  def destroy
    @physician.destroy
    redirect_to physicians_path
  end

  private
    def set_physician 
      @physician = Physician.find(params[:id])
    end

    def physician_params
      params.require(:physician).permit(:name)
    end
end
