class TotalSalesSummaryController < ApplicationController
  def total_sales_summary
  end

  def show
    @language = Language.all
  end
end
