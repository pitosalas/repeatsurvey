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
			prog.questions.create(text: surv.question(x-1).text, order: surv.question(x-1).index)
		end
	end

	desc "import rounds form last metricalc round"
	task :rounds => [:program] do
		prog = Program.first
		rcount = 0
		surv.rounds.each do |rnd|
			puts "Adding round #{rcount}, start: #{rnd.start}, fin: #{rnd.fin}"
			prog.rounds.create(number: rcount, start: rnd.start, fin: rnd.fin)
			rcount += 1
		end
	end

	desc "create respondent records"
		task :respondents => :environment do
		prog = Program.first

		prog.respondents.create(:name => "Unknown")
		prog.respondents.create(:name => "Rachel")
		prog.respondents.create(:name => "Jeremy Coffman")
		prog.respondents.create(:name => "Sam")
		prog.respondents.create(:name => "Eitan")
		prog.respondents.create(:name => "Kendall")
		prog.respondents.create(:name => "Avishek Neupane")
		prog.respondents.create(:name => "Mustapha Isa")
		prog.respondents.create(:name => "Shu Lin")
		prog.respondents.create(:name => "Fatima")
		prog.respondents.create(:name => "Ezra")
		prog.respondents.create(:name => "Tom")
		puts "Added Unknown + 11 Students from JBS 2012"
	end

	desc "import all the individual cells of data"
	task :data => [:program, :questions, :rounds, :respondents] do
		prog = Program.first
		Round.all.each do |rnd|
			puts "Adding data items for Round #{rnd.number}"
			Question.all.each do |qst|
				((rnd.start)..(rnd.fin)).each do 
					|resp_row|
		 			Value.create do |v|
		 				cell = surv.cell(qst.order, resp_row)
		 				who = surv.cell(30, resp_row)
		 				if (resp = Respondent.find(:first, :conditions => ["name LIKE ?", who]))
		 					v.respondent = resp
		 				else
		 					v.respondent = Respondent.find_by_name("Unknown")
		 				end
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
		bulk_destroy Value
	end
end
