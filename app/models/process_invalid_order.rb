class ProcessInvalidOrder < RailsWorkflow::UserByRoleOperation
  def on_complete
    self.data[:orderValid] = true
    save
  end
end