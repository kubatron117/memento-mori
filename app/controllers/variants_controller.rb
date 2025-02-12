class VariantsController < ApplicationController
  before_action :set_variant, only: %i[ show update destroy ]

  # GET /variants
  # GET /variants.json
  def index
    @variants = Variant.all
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = Variant.new(variant_params)

    if @variant.save
      render :show, status: :created, location: @variant
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /variants/1
  # PATCH/PUT /variants/1.json
  def update
    if @variant.update(variant_params)
      render :show, status: :ok, location: @variant
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /variants/1
  # DELETE /variants/1.json
  def destroy
    @variant.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.expect(variant: [ :var_id, :variant ])
    end
end
