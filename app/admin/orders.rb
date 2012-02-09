# encoding: utf-8	 
ActiveAdmin.register Order do
	menu :label => "Подключения" 
	
	scope 'Новые' ,:new_orders, :default => true 
	scope 'Обработанные', :processed_orders
	scope 'Завершенные', :completed_orders 
	scope :all
	
	filter :due_date, :label => "Дата подключения"
 
	index do
		column "Клиент" do |order|
			link_to order.name, admin_order_path(order)
		end
		column "Контакты", :contact
		column "Регион", :region
		column "Дата подключения", :due_date
		column "Состояние" do |order|
			status_tag order.status, order.status_tag
		end
	end
	
	show do
		panel "Общие" do
			attributes_table_for order do 
				row("Состояние") { status_tag order.status, order.status_tag }
				row("Клиент") { order.name+( order.company.eql?('1') ? ' (Юр.лицо)' : '' ) }
				row("Контакты") { order.contact }
				row("Регион") { order.region }
				row("Адрес") { order.address }
				row("Дата подключения") { (order.due_date ? order.due_date.strftime('%d-%m-%Y') : '')+( order.due_time ? ' в '+order.due_time.strftime('%H:%M') : '') }
			end
		end		 
		panel "Услуги" do	 
			table_for order.services.order('service_category_id desc') do |t|
				t.column("Услуга") { |service| service.name }
				t.column("Цена") { |service| service.price.to_s+' руб.' }
				t.column("Категория") { |service| service.service_category.name }
			end
			attributes_table_for order do
				row("ИТОГО:") { order.services.sum(:price).to_s+' руб.' }
			end
		end	 
		active_admin_comments
	end
	
	form do |f|
		f.inputs "Детали" do
			f.input :company, :label => "Юр. лицо", :as => :boolean
			f.input :name, :label => 'Клиент'
			f.input :contact, :label => 'Контакты'
			f.input :region, :label => 'Регион', :as => :select, :collection => ['Химки', '1-Мая', 'Другое'], :include_blank => false
			f.input :address, :label => 'Адрес'
			f.input :due_date, :label => "Дата подключения", :as => :datepicker
			f.input :due_time, :label => "Время подключения", :as => :time
			f.input :status, :label => "Состояние" ,:as => :select, :collection => ["Новый", "Обработан", "Завершен"], :selected => ( f.object.status.nil? ? "Новый" : f.object.status ), :include_blank => false
		end	
	  f.has_many :order_services do |i|
  		  unless i.object.id.nil?
  			  i.input :_destroy, :as => :boolean, :label => "Удалить" 
  			  i.input :service, :label => "услуга", :as => :select,	:collection => Service.all
  		  else 
  	      i.input :service, :label => "Категория", :input_html => { :class => 'category_select' } ,:as => :select, :collection => ServiceCategory.all
  	      i.input :service, :label => "услуга", :as => :select, :collection => Service.where('in_stock = ?', '1'), :group_by => :service_category, :input_html => { :class => 'service_select' } 
  	   end
		end
		f.buttons
	end
	
	controller do
    def create
      @resource = Order.create(params[:order])
      OtrsMailer.send_new_order(@resource).deliver!
      redirect_to admin_order_url(@resource)
    end
  end
	
end
