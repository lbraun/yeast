class YeastTypesController < ApplicationController
  before_action :set_yeast_type, only: [:show, :edit, :update, :destroy]

  # GET /yeast_types
  # GET /yeast_types.json
  def index
    @yeast_types = YeastType.all
  end

  # GET /yeast_types/1
  # GET /yeast_types/1.json
  def show
  end

  # GET /yeast_types/new
  def new
    @yeast_type = YeastType.new
  end

  # GET /yeast_types/1/edit
  def edit
  end

  # POST /yeast_types
  # POST /yeast_types.json
  def create
    @yeast_type = YeastType.new(yeast_type_params)

    respond_to do |format|
      if @yeast_type.save
        format.html { redirect_to @yeast_type, notice: 'Yeast type was successfully created.' }
        format.json { render :show, status: :created, location: @yeast_type }
      else
        format.html { render :new }
        format.json { render json: @yeast_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yeast_types/1
  # PATCH/PUT /yeast_types/1.json
  def update
    respond_to do |format|
      if @yeast_type.update(yeast_type_params)
        format.html { redirect_to @yeast_type, notice: 'Yeast type was successfully updated.' }
        format.json { render :show, status: :ok, location: @yeast_type }
      else
        format.html { render :edit }
        format.json { render json: @yeast_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yeast_types/1
  # DELETE /yeast_types/1.json
  def destroy
    @yeast_type.destroy
    respond_to do |format|
      format.html { redirect_to yeast_types_url, notice: 'Yeast type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    YeastType.import(params[:file])
    redirect_to yeast_types_path, notice: "Yeast types imported!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yeast_type
      @yeast_type = YeastType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yeast_type_params
      params.require(:yeast_type).permit(:sequence_name, :mcg, :gvh, :alm, :mit, :erl, :pox, :vac, :nuc, :localization_site, :longitude, :latitude)
    end
end
