class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_confirmation_email(order)
    # @user = user
    
    @url  = 'http://example.com/login'
    mail(to: 'bowtree00@gmail.com', subject: 'Welcome to My Awesome Site')
    # mail(to: order.email, subject: 'Welcome to My Awesome Site')

  end
end
