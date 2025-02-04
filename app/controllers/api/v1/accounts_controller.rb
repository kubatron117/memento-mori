class Api::V1::AccountsController < ApplicationController
  #GET /api/v1/account/info
  def account_info

    @account = Account.find(current_account.id)
    render format: :json
  end
end
