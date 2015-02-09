class OrdersController < InheritedResources::Base

  def new
    @order = Order.new
    Product.find_each {|p| @order.lines.build(product: p, qty: 0)}
    new!
  end

  def create
    @order = Order.create(
        order_params.merge(customer: current_user)
    )

    create!
  end

  private

    def order_params
      params.require(:order).permit(lines_attributes: [:id, :qty, :product_id])
    end
end

