class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_confirmation_email(order)
    @order = order
    # @url  = 'http://example.com/login'

    mail(to: 'bowtree00@gmail.com', subject: 'Your Jungle Order Confirmation for Order ID #' + order.id.to_s)
    # mail(to: order.email, subject: 'Your Jungle Order Confirmation')

  end
end
