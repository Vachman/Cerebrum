# encoding: utf-8
ActiveAdmin.register LogMessage do
  menu :label => "Логи", :parent => "Оборудование"  
  
  scope :all, :default => true
  scope "Информация", :info_log
  scope "Ошибки", :warn_log
  
  filter :hostname, :label => "IP"
  filter :created_at, :label => "Дате"
  
  index do
    column "Время" do |log_message|; log_message.created_at; end
    column "Устройство" do |log_message|; log_message.hostname; end
    column "Сообщение" do |log_message|; log_message.message; end
    column "Стстус" do |log_message|
      status_tag log_message.facility, (  log_message.facility.to_s == 'WARN' ? :error : :warning  )
    end
  end

end