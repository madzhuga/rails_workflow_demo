class ProcessInvalidOrder < Workflow::UserByRoleOperation
  def on_complete
    self.data[:orderValid] = true
    save
  end
end