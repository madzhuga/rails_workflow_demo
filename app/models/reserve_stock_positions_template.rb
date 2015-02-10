class ReserveStockPositionsTemplate < RailsWorkflow::OperationTemplate
  def resolve_dependency operation
    operation.data[:orderValid]
  end
end