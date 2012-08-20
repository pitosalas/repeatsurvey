class ProgramsController < ApplicationController
  respond_to :html, :xml, :json
  def show
    @program = Program.find(params[:id])
    show_program
  end

  def current
    @program = Program.first
    show_program
  end

  def new
    @program = Program.new
    respond_with(@program)
  end

  def show_program
    @respondents = @program.respondents
    @questions = @program.questions
    @rounds = @program.rounds
    respond_with([:program => @program, :respondents => @respondents, 
                 :question => @questions, :rounds => @rounds], 
                 :template => 'programs/show')
  end

  def index
    @program_report = ProgramReport.new(params[:program_report])
    @assets = @program_report.assets.page(params[:page])
  end

end

