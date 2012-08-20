class ProgramReport
  include Datagrid

  scope do
    Program
  end

  column(:name, :html => true, :order => false) do
   |program| link_to(program.name, program)
  end
  column("rounds of surveys") { |program| program.rounds.count } 
  column("# of questions defined") { |program| program.questions.count }
  column(:edits, :html => true) do
    |program|
        link_to('Show', program) + " | " +
        link_to('Edit', edit_program_path(program)) + " | " +
        link_to('', program, { method: :delete, class: "icon-remove-sign", data: { confirm: 'Are you sure?' }})
    end
  end
