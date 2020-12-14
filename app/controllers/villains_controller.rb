class VillainsController < ApplicationController
  before_action :set_villain, only: [:show, :update, :destroy]

  # GET /villains
  def index
    @villains = Villain.all
    render json: @villains, include: :hero
  end

  # GET /villains/1
  def show
    render json: @villain, include: :hero
  end

  # POST /villains
  def create
    @villain = Villain.new(villain_params)

    if @villain.save
      render json: @villain, status: :created, location: @villain
    else
      render json: @villain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /villains/1
  def update
    render :json 'No updates allowed'
    # no updates allowed
    # if @villain.update(villain_params)
    #   render json: @villain
    # else
    #   render json: @villain.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /villains/1
  def destroy
    render :json 'No deletes allowed'
    # no deletes allowe
    # @villain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_villain
      @villain = Villain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def villain_params
      params.require(:villain).permit(:name, :hero_id, :img_url)
    end
end
