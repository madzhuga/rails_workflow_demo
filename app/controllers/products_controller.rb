class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :active, :vendor_id, :unit_price, :stock_qty, :reserved_qty, :min_qty)
    end
end

