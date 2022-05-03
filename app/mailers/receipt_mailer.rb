class ReceiptMailer < ApplicationMailer
	default from: 'appliance2020@gmail.com'

	def welcome_email
		@receipt = params[:receipt]
		@payment = Payment.find(@receipt.payment_id)
		@order = Order.find(@payment.order_id)
		@customer = Customer.find(@order.customer_id)
		puts('***************************')
		puts(@user)
		@url  = 'noCluewhat this should be'
		mail(to: @receipt.address, subject: 'Thank you for your business')
	end
end