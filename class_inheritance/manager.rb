require_relative "employee.rb"

class Manager < Employee

    def initialize(value)
        @value = value
        @employees = []
    end

    def add_employee(node)
        if node != nil && @employees.none? { |employee| employee.value == node.value }
            node.boss = self
        end
    end

    def remove_employee(node)
        if @employees.any? { |employee| employee.value == node.value }
            node.boss = nil
            @employees.delete(node)
        else
            raise "No such employee"
        end
    end

end
