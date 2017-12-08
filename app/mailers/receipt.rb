class Receipt < ApplicationMailer
  default from: 'reply@jungle.com',
          return_path: 'system@jungle.com'

  def mailer(order)
    @order = order
    mail(to: order.email,
         bcc: ['bcc@jungle.com', 'Order Watcher <watcher@jungle.com>'])
  end
end
