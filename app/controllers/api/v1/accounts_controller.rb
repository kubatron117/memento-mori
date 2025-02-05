class Api::V1::AccountsController < ApplicationController
  #GET /api/v1/account/info
  def account_info

    if current_account.present?
    @account = Account.find(current_account&.id)
    render format: :json
    else
      render json: {error: "Account not found"}, status: :not_found
    end
  end
end
