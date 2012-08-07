require_relative "./lib/survey_data"
require_relative "./lib/input_data"
require_relative "./lib/response"
require_relative "./lib/round"

if __FILE__ == $0
  surv = SurveyData.new
  inp = InputData.new 
  inp.read "/mydev/metricalc/data/weekly4file.csv", surv
  surv.process
  puts "File read in."
  puts "found #{surv.n_responses} responses."
  puts "found #{surv.n_rounds} of survey."

  puts "Found #{surv.n_questions} questions"
  surv.n_questions.times do
  	|x| puts "#{surv.question(x-1).index}. #{surv.question(x-1).text}"
  end
end