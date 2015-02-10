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

    create! do |success, failure|
      success.html do
        process_template_id = 1
        RailsWorkflow::ProcessManager.start_process(
            process_template_id , { resource: resource }
        )

        redirect_to orders_path
      end
    end
  end

  def update
    update! do |success, failure|
      success.html do
        if current_operation && (params['commit'] == 'Complete')
          current_operation.complete
        end

        redirect_to root_path
      end
    end
  end


  private

    def order_params
      params.require(:order).permit(lines_attributes: [:id, :qty, :product_id])
    end
end

