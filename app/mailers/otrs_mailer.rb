# encoding: utf-8
class OtrsMailer < ActionMailer::Base
  default from: "cerebrum@obltelecom.ru"
 
  def destination(order)
    case order.region
    when 'Химки'
      'himki.otrs@obltelecom.ru'
    when '1-Мая'
      '1may.otrs@obltelecom.ru'
    else 
      'otrs@obltelecom.ru'  
    end
  end
  
  def send_new_order(order)
      @order = order
      mail(:to => destination(order) , :subject => "Подключение: #{order.name} - #{ (@order.due_date ? @order.due_date.strftime('%d-%m-%Y') : '')+( @order.due_time ? ' в '+@order.due_time.strftime('%H:%M') : '') }")
  end
  

end
