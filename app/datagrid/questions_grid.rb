class QuestionsGrid
  include Datagrid

  scope do
    Question
  end

  def initialize parameters
    super(parameters)
    puts "****** #{parameters}"
  end



  column("ordering", order: true, html: true) do
    |q| q.order
  end
  column("text", order: true, html: true) do 
    |q| link_to(q.text, program_question_path(q.program, q))
  end
  column("active") { |q| q.active }
  column("responses so far") { |q| q.respondents.select(:name).uniq.length }
  column("data type") { |q| q.data_type }

  column("actions", :html => true) do
    |q|
        link_to('Show', program_question_path(q.program, q)) + " | " +
        link_to('Edit', edit_program_question_path(q.program, q)) + " | " +
        link_to('', program_question_path(q.program, q), { method: :delete, class: "icon-remove-sign", data: { confirm: 'Are you sure?' }})
  end
end

