require_relative "employee.rb"

class Manager < Employee
    def initialize
        @employees = []
    end


    def add_employee(node)
        if node != nil && @employees.none? { |employee| employee.name == node.name}
            node.boss = self
        end
    end

    def remove_employee(node)
        if @employees.any? { |employee| employee.name == node.name }
            node.boss = nil
            @employees.delete(node)
        else
            raise "No such employee"
        end
    end

    def employees_salaries
        total_pay = 0
        @employees.each do |employee|
            total_pay += employee.salary 
        end
        total_pay 
    end

    private
    def bonus(multiplier)
        employees_salaries * multiplier
    end

end


# p ned = Employee.new("ned",1000000, "founder")
# p darren = Employee.new("darren",78000,"ta_manager","ned")
# p shawna = Employee.new("shawna",12000,"ta","darren")
# p david = Employee.new("david",10000,"ta","darren")