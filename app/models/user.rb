class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # symbolize :role, in: [:admin, :customer, :sale, :stock]

  def self.get_role_values
    [["Admin", "admin"], ["Customers", "customer"], ["Sales Team", "sale"], ["Stock Provisioning", "stock"]]
  end
  include RailsWorkflow::User::Assignment

end
