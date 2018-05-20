# coding: utf-8
class TransactionsController < ApplicationController
  require 'csv'

  def index
    if Rails.env == 'production'
      @env = '本番'
    else
      @env = '開発'
    end
    @transactions = CSV.read(TRANSACTION_LOG_PATH, "r:ISO-8859-1")
  end

end
