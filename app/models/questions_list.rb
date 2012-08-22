class QuestionsList
  include Datagrid

  scope do
    Question
  end

  column("order", :html => true, :order => true)
  # do
  # |question| link_to(question.order, question)
  #end
  column("text", order: true) { |question| question.text} 
  column("active") { |question| question.active }
  column("responses so far") { |question| question.respondents.select(:name).uniq.length }
  column("data type") { |question| question.data_type }

  column("actions", :html => true) do
    |question|
        link_to('Show', question) + " | " +
        link_to('Edit', edit_program_question_path(question)) + " | " +
        link_to('', program_question, { method: :delete, class: "icon-remove-sign", data: { confirm: 'Are you sure?' }})
  end
end

