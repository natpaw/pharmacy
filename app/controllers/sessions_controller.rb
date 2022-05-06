class SessionController < ActionController
	def create
		session[:current_order_id] = @order.id
	end	
	def index
		current_order = Order.find_by_id(session[:current_order_id])
	end
end
