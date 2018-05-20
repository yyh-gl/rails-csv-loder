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
    csv_data = CSV.read(TRANSACTION_LOG_PATH, "r:ISO-8859-1")
    @bank_data = []
    @bank_data_list = []
    @transaction_data =[]
    count = 0
    csv_data.each do |data|
      if count % 2 == 0
        @bank_data << data[0]
        data[1..-1].each_slice(2) do |a, b|
          @bank_data << [a, b]
        end
        @bank_data_list << @bank_data
        @bank_data = []
      else
        @transaction_data << data
      end
      count += 1
    end
    pp @bank_data_list
  end

end
