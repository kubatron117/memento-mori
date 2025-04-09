class Api::V1::AccountsController < ApplicationController
  before_action :authenticate
  #GET /api/v1/account/info
  def account_info
    if current_account.present?
    @account = Account.find(current_account&.id)
    render format: :json
    else
      render json: {error: "Account not found"}, status: :not_found
    end
  end

  #PUT /api/v1/account/dates
  def update_dates
    if current_account.present?
      @account = Account.find(current_account&.id)
      if @account.update(account_dates_params)
        render "account_info", status: :ok
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "Account not found"}, status: :not_found
    end
  end

  def account_dates_params
    params.expect(account: [:date_of_birth, :estimated_lifespan])
  end

end
