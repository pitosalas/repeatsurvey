class ReportsController < ApplicationController
  respond_to :html, :xml, :json, :js

  def show
    @program = Program.find(params[:program_id])
    partial_name = "_"+params[:id]+".html.erb"
    render partial_name
  end

  def report1
    @program = Program.find(params[:program_id])
    render :partial => "report1", layout: false
  end
end
