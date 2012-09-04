class ProgramsController < ApplicationController
  respond_to :html, :xml, :json, :js
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
    @questions_grid = QuestionsGrid.new(params[:questions_grid])
    @qg_assets = @questions_grid.assets.paginate(page: params[:page])

    respond_with([:program => @program, :respondents => @respondents, 
                 :question => @questions, :rounds => @rounds], 
                 :template => 'programs/show')
  end

  def index
    @programs_grid = ProgramsGrid.new(params[:programs_grid])
    @assets = @programs_grid.assets.page(params[:page])
  end

end

