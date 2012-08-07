namespace :import do
	require_relative "../metricalc/metricalc.rb"
	surv = SurveyData.new
	inp = InputData.new
	inp.read "/mydev/metricalc/data/week9file.csv", surv
	surv.process
	round_range = []

	desc "create initial JBS program" 
	task :program => :environment do
		Program.create(:name => "JBS 2012")
		puts "1 Program created 'JBS 2012'"
	end

	desc "import questions from last round of metricalc"
	task :questions => [:program] do
		prog = Program.first
		surv.n_questions.times do |x|
			puts "Adding question #{surv.question(x-1).text} [#{surv.question(x-1).index}]"
			prog.question.create(text: surv.question(x-1).text, order: surv.question(x-1).index)
		end
	end

	desc "import rounds form last metricalc round"
	task :rounds => [:program] do
		prog = Program.first
		rcount = 0
		surv.rounds.each do |rnd|
			puts "Adding round #{rcount}, start: #{rnd.start}, fin: #{rnd.fin}"
			prog.round.create(number: rcount, start: rnd.start, fin: rnd.fin)
			rcount += 1
		end
	end

	desc "create respondent records"
		task :respondents => :environment do
		Respondent.create(:name => "Rachel")
		Respondent.create(:name => "Jeremy")
		Respondent.create(:name => "Sam")
		Respondent.create(:name => "Eitan")
		Respondent.create(:name => "Kendall")
		Respondent.create(:name => "Avishek")
		Respondent.create(:name => "Mustapha")
		Respondent.create(:name => "Shu-Lin")
		Respondent.create(:name => "Fatima")
		Respondent.create(:name => "Ezra")
		Respondent.create(:name => "Tom")
		puts "Added 11 Students from JBS 2012"
	end

	desc "import all the individual cells of data"
	task :data => [:program, :questions, :rounds, :respondents] do
		prog = Program.first
		Round.all.each do |rnd|
			Question.all.each do |qst|
				((rnd.start)..(rnd.fin)).each do 
					|resp_row|
		 			Value.create do |v|
		 				cell = surv.cell(qst.order, resp_row)
						v.value = !cell.nil? ? (Response.string2choice(cell)) : nil
						v.question = qst
						v.round = rnd
						v.respondent_id = 0
					end
				end
			end
		end
	end

	# Convenient shorthand
	def bulk_destroy(clazz)
		puts "Destroying all objects of class #{clazz.to_s} (#{clazz.count})"
		clazz.destroy_all
	end


	desc "delete all records from an import"
	task :reset => :environment do
		bulk_destroy Program
		bulk_destroy Respondent
		bulk_destroy Round
		bulk_destroy Question
		bulk_destroy Program
		bulk_destroy Value
	end
end
