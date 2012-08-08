class RoundsController < ApplicationController
	respond_to :html, :xml

	def report
     	@program = Program.find_by_id(params[:program_id])
     	@round = Round.find_by_id(params[:id])
      @questions = @program.questions.all
      respond_with([@round, @program, @questions])
  end
end
