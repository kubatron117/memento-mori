class Api::V1::LifeExpectanciesController < ApplicationController
  before_action :set_life_expectancy, only: %i[ show update destroy ]

  # GET /life_expectancies
  # GET /life_expectancies.json
  def index
    @life_expectancies = LifeExpectancy.all
  end

  # GET /life_expectancies/1
  # GET /life_expectancies/1.json
  def show
  end

  # POST /life_expectancies
  # POST /life_expectancies.json
  def create
    @life_expectancy = LifeExpectancy.new(life_expectancy_params)

    if @life_expectancy.save
      render :show, status: :created, location: @life_expectancy
    else
      render json: @life_expectancy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /life_expectancies/1
  # PATCH/PUT /life_expectancies/1.json
  def update
    if @life_expectancy.update(life_expectancy_params)
      render :show, status: :ok, location: @life_expectancy
    else
      render json: @life_expectancy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /life_expectancies/1
  # DELETE /life_expectancies/1.json
  def destroy
    @life_expectancy.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_life_expectancy
      @life_expectancy = LifeExpectancy.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def life_expectancy_params
      params.expect(life_expectancy: [ :birth_year, :life_expectancy_both, :life_expectancy_male, :life_expectancy_female, :loc_id, :location_id, :variant_id ])
    end
end
