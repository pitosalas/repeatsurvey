class QuestionsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @questions_list = questions_list.new(params[:program_report])
    @ql_assets = @questions_list.assets.paginate(page: params[:page])
  end

  def new
    @program = Program.find(params[:program_id])
    @question = @program.questions.build
    respond_with(@question)
  end

  def create  
    @program = Program.find(params[:program_id])
    @question = @program.questions.new(params[:question])  
    if @question.save  
      redirect_to program_path(@program,  tab: 'questions'), 
                  notice: "Successfully created question."
    else  
      render :action => 'new'  
    end  
  end  

  def show
    @program = Program.find(params[:program_id])
    @question = Question.find(params[:id])
    respond_with(@program, @question)
  end

  def edit
    @question = Question.find(params[:id])
    @program = Program.find(params[:program_id])
  end

  def update
    @program = Program.find(params[:program_id])
    @question = @program.questions.find(params[:id])  
    if @question.update_attributes(params[:question])  
      flash[:notice] = "Successfully updated question."  
    end  
    respond_with(:program, @question)  
  end  

  def destroy
    puts params
    @question = Question.find(params[:id])  
    @question.destroy  
    flash[:notice] = "Question deleted."  
    respond_with(:program, @question)  
  end
end