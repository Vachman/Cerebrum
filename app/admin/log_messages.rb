# encoding: utf-8
ActiveAdmin.register LogMessage do
  menu :label => "Логи", :parent => "Оборудование"  
  
  scope :all, :default => true
  scope "Информация", :info_log
  scope "Ошибки", :warn_log
  
  filter :hostname, :label => "IP"
  filter :created_at, :label => "Дате"
  
  index do
    column "Дата" do |log_message|; log_message.created_at.strftime("%Y- %m-%d %H:%M:%S"); end
    column "Стстус" do |log_message|
      status_tag log_message.facility, (  log_message.facility.to_s == 'WARN' ? :error : :warning  )
    end
    column "Устройство" do |log_message|
      if !log_message.host.nil?
        link_to log_message.host.name, admin_host_path(log_message.host)
      else
        log_message.hostname
      end
    end
    column "Сообщение" do |log_message|; log_message.message; end
  end
  

end
