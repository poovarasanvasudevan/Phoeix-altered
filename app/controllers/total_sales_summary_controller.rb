class TotalSalesSummaryController < ApplicationController
  def total_sales_summary
  end

  def show
    @language = Language.all
  end


  def constructdatatable

    filter_params = Hash.new
    filter_params[:location_id] = params[:location_id]
    filter_params[:language_id] = params[:language_id]
    filter_params[:from_date] = params[:from_date] || '01/04/2015'

    if (params[:to_date]=='')
      filter_params[:to_date] = Time.zone.now.strftime('%d/%m/%Y')
    else
      filter_params[:to_date] = params[:to_date]
    end

    @stock_summary = LanguageReport.locationwise_stock_summary({}, filter_params)

    respond_to do |format|
      format.xls { send_data LanguageReport.locationwise_stock_summary({col_sep: "\t"}, filter_params), filename: "total_sales_summary_#{Time.zone.now.in_time_zone.strftime('%Y%m%d')}.xls" }
      format.html
    end
  end

end
