# encoding: utf-8
ActiveAdmin.register LogMessage do
  menu :label => "Логи", :parent => "Оборудование"  
  
  scope :all, :default => true
  scope "Информация", :info
  scope "Ошибки", :warn
  
  filter :hostname, :label => "IP"
  filter :create_at, :label => "Дате"
  
  index do
    column "Время" do |log_message|; log_message.log_time; end
    column "Устройство" do |log_message|; log_message.hostname; end
    column "Сообщение" do |log_message|; log_message.message; end
    column "Стстус" do |log_message|
      status_tag log_message.facility, (  log_message.facility.to_s == 'WARN' ? :error : :warning  )
    end
  end
end
