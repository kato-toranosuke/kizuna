class RestSearchModelsController < ApplicationController
  before_action :set_rest_search_model, only: [:show, :edit, :update, :destroy]

  # GET /rest_search_models
  # GET /rest_search_models.json
  def index
  #  @rest_search_models = RestSearchModel.all
    @q = RestSearchModel.ransack(params[:q])
    @rest_search_models = @q.result(distinct: true)
  end

  # GET /rest_search_models/1
  # GET /rest_search_models/1.json
  def show
  end

  # GET /rest_search_models/new
  def new
    @rest_search_model = RestSearchModel.new
  end

  # GET /rest_search_models/1/edit
  def edit
  end

  # POST /rest_search_models
  # POST /rest_search_models.json
  def create
    @rest_search_model = RestSearchModel.new(rest_search_model_params)

    respond_to do |format|
      if @rest_search_model.save
        format.html { redirect_to @rest_search_model, notice: 'Rest search model was successfully created.' }
        format.json { render :show, status: :created, location: @rest_search_model }
      else
        format.html { render :new }
        format.json { render json: @rest_search_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rest_search_models/1
  # PATCH/PUT /rest_search_models/1.json
  def update
    respond_to do |format|
      if @rest_search_model.update(rest_search_model_params)
        format.html { redirect_to @rest_search_model, notice: 'Rest search model was successfully updated.' }
        format.json { render :show, status: :ok, location: @rest_search_model }
      else
        format.html { render :edit }
        format.json { render json: @rest_search_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rest_search_models/1
  # DELETE /rest_search_models/1.json
  def destroy
    @rest_search_model.destroy
    respond_to do |format|
      format.html { redirect_to rest_search_models_url, notice: 'Rest search model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rest_search_model
      @rest_search_model = RestSearchModel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rest_search_model_params
      params.require(:rest_search_model).permit(:name, :mask, :temp, :alcohol, :takeout, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :googlemap, :tabelog, :homepage)
    end
end
