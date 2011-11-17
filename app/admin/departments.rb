# encoding: utf-8
ActiveAdmin.register Department do 
  menu :parent => "Сотрудники"

  filter :name, :label => "Названию"

  index do
    column "Отдел", :name
    default_actions
    #binding.pry
    
  end
  
  show do
    panel "Подробности" do
      attributes_table_for department do
        row("Отдел") { department.name }
      end
    end
  end
  
  form do |f| 
    f.inputs do
      f.input :name, :label => "Отдел"
    end
    f.buttons
  end
end
