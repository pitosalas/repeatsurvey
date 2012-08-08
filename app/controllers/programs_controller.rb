class ProgramsController < ApplicationController
  respond_to :html, :xml, :json
  def show
    @program = Program.find(params[:id])
    @respondents = @program.respondents
    @questions = @program.questions
    @rounds = @program.rounds
    respond_with(:program => @program, :respondents => @respondents, 
                 :question => @questions, :rounds => @rounds)
  end
end

