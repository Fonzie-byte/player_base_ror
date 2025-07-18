class AccountsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_account, only: %i[ show destroy ]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      render :show, account: @account, status: :created, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: t(".destroyed")
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.expect(account: %i[username password password_confirmation])
  end
end
