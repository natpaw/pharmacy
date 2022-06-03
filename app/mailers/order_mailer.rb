class OrderMailer < ApplicationMailer
	def order_user_email
		@order = params[:order]
		@user = @order.user
		@url = 'http://example.com/orders/' + @order.id.to_s + '/ordered_medicines'
		mail(to: @order.user.email, subject: 'Замовлення')
	end
	
	def order_admin_email
		@order = params[:order]
		@admin = User.find_by admin: true
		@url = 'http://example.com/orders/' + @order.id.to_s + '/ordered_medicines'
		mail(to: @admin.email, subject: 'Замовлення')
	end
end
