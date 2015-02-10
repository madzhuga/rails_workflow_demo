class ReserveStockPositions < RailsWorkflow::Operation
  def execute
    resource = data[:resource]
    resource.lines.each do |order_line|
      product = order_line.product

      product.reserved_qty =
          product.reserved_qty.to_i + order_line.qty

      product.save
    end

  end
end