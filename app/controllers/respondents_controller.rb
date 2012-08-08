class RespondentsController < ApplicationController
  respond_to :html, :xml, :json

  def show
    @respondent = Respondent.find(params[:id])
    @program = @respondent.program
    @questions = @program.questions
    respond_with(:respondents => @respondents)
  end

  def index
  end
end
