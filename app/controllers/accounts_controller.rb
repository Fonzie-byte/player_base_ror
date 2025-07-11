class AccountsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_account, only: [ :show, :destroy ]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: "Account was successfully deleted."
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end
end
