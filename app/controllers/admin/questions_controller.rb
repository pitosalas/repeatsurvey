module Admin
	class QuestionsController < ApplicationController
		active_scaffold :question do |config|
		end
	end
end
