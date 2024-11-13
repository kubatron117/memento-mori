class WeeksInLivesController < ApplicationController
  before_action :set_weeks_in_life, only: %i[ show update destroy ]

  # GET /weeks_in_lives
  # GET /weeks_in_lives.json
  def index
    @weeks_in_lives = WeeksInLife.all
  end

  # GET /weeks_in_lives/1
  # GET /weeks_in_lives/1.json
  def show
  end

  # POST /weeks_in_lives
  # POST /weeks_in_lives.json
  def create
    @weeks_in_life = WeeksInLife.new(weeks_in_life_params)

    if @weeks_in_life.save
      render :show, status: :created, location: @weeks_in_life
    else
      render json: @weeks_in_life.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weeks_in_lives/1
  # PATCH/PUT /weeks_in_lives/1.json
  def update
    if @weeks_in_life.update(weeks_in_life_params)
      render :show, status: :ok, location: @weeks_in_life
    else
      render json: @weeks_in_life.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weeks_in_lives/1
  # DELETE /weeks_in_lives/1.json
  def destroy
    @weeks_in_life.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weeks_in_life
      @weeks_in_life = WeeksInLife.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def weeks_in_life_params
      params.expect(weeks_in_life: [ :start_date, :end_date, :week_number, :memo, :account_id ])
    end
end
