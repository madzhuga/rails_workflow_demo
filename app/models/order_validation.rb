class OrderValidation < Workflow::Operation
  def execute
    self.data[:orderValid] = false
    save
  end
end