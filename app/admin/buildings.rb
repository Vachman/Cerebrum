# encoding: utf-8
ActiveAdmin.register Building do
  menu :parent => "Справочник"
  
  filter :name, :label => "Дому"

  sidebar "Дом", :only => :show do
    attributes_table_for building do
      row("Дом") { link_to building.name, "http://maps.yandex.ru/?text=#{building.name}",{ :target => "_new", :title => "Показать на карте" } }
      row("Контакты ЖКХ") { building.housing.phone unless building.housing.nil? } 
    end
  end

  index do 
    column "Дом", :name
    column "Контакты ЖКХ" do |building|
      building.housing.nil? ? "-" : building.housing.phone
    end
    default_actions  
  end
  
  form do |f|
    f.inputs do
      f.input :name, :label => "Дом"
      f.input :housing, :label => "ЖКХ"
    end
    f.buttons
  end
  
  show :title => :page_title do
    panel "Оборудование" do
      table_for building.hosts do |t|
        t.column("IP Адрес") { |host| link_to host.name, admin_host_path(host)}
        t.column "Устройство" do |host|
          host.device_type.model unless host.device_type.nil? 
        end
        column "Состояние" do |host| 
          if host.lastms.is_a?(Time) 
            status_tag (host.lastms > Time.now-1.minute ? 'Доступен' : 'Недоступен' ), 
            ( host.lastms > Time.now-1.minute ? :ok : :error ), 
            :title => time_ago_in_words(host.lastms)  
          else
            status_tag "Неизвестно", :title => "Сроду не видели"
          end
        end
        t.column("Подъедз") { |host| host.porch}
        t.column("Местонахождение") do |host| 
          status_tag host.location, ( host.location.eql?('Чердак') ? :ok : :warning ) unless host.location.nil? or host.location.empty?   
        end  
      end unless building.hosts.empty?
    end
  end  
  
end
