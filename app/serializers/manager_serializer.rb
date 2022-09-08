class ManagerSerializer

  def self.new_manager_data(manager)
    {
      "data": {
        "type": "manager",
        "id": manager.id,
        "attributes": {
          "name": manager.name,
          "email": manager.email
        }
      }
    }
  end
end 