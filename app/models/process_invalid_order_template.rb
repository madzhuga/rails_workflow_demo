class ProcessInvalidOrderTemplate < RailsWorkflow::OperationTemplate
  def build_operation operation
    resource = operation.data[:resource]
    operation.title += " ##{resource.id}"

    operation.context.data.merge!({
                        url_path: :edit_order_path,
                        url_params: [resource]

                    })
  end


  def resolve_dependency operation
    !operation.data[:orderValid]
  end

end