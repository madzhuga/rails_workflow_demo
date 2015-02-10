class OrderValidation < RailsWorkflow::Operation
  def execute
    self.data[:orderValid] = false
    save
  end
end