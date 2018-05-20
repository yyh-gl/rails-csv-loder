# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 取引データのログ
  if Rails.env == 'production'
    TRANSACTION_LOG_PATH = '/Users/isdl-light/Server/tyc-manager/log/transaction_log.csv'.freeze
  else
    TRANSACTION_LOG_PATH = '/Users/Y_h/Desktop/test.csv'.freeze
  end
end
