class TransactionsController < ApplicationController
  require 'csv'

  def index
    if Rails.env == 'production'
      @env = '本番'
    else
      @env = '開発'
    end
    @transactions = CSV.read(TRANSACTION_LOG_PATH)
  end

end
