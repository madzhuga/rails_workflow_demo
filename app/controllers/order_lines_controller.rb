class OrderLinesController < InheritedResources::Base

  private

    def order_line_params
      params.require(:order_line).permit(:order_id, :product_id, :qty)
    end
end

