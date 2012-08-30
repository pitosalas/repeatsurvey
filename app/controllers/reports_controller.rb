class ReportsController < ApplicationController
  def show
    @program = Program.find(params[:program_id])
    partial_name = "_"+params[:id]+".html.erb"
    render partial_name
  end
end
