json.array!(@products) do |product|
  json.extract! product, :id, :name, :active, :vendor_id, :unit_price, :stock_qty, :reserved_qty, :min_qty
  json.url product_url(product, format: :json)
end
