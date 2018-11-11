# TODO: ページネーション機能
class TransactionsController < ApplicationController
  require 'csv'

  def index
    @lab_member_num = LAB_MEMBER_NUM
    if Rails.env == 'production'
      @env = '本番'
    else
      @env = '開発'
    end

    # csv_data = CSV.read(TRANSACTION_LOG_PATH, "r:ISO-8859-1")
    bank_data = []
    @bank_data_list = []
    tyc_amount = 0
    @tyc_amount_list = []
    @transaction_data =[]
    count = 0
    CSV.foreach(TRANSACTION_LOG_PATH, encoding: 'Shift_JIS:UTF-8') do |data|
      if count % 2 == 0
        bank_data << data[0]
        data[1..-1].each_slice(2) do |a, b|
          bank_data << [a, b]
          tyc_amount += b.to_i
        end
        @bank_data_list << bank_data
        bank_data = []
        @tyc_amount_list << tyc_amount
        tyc_amount = 0
      else
        # puts '----------'
        # pp data[8].encode('UTF-8')
        # puts '----------'
        # data[8].encode!('UTF-8', 'Shift_JIS')
        @transaction_data << data
      end
      count += 1
    end
  end

end
