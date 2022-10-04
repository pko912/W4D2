
class Employee 
    attr_accessor :name, :salary, :title, :boss

    def initialize(name, salary, title, boss=nil)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
        self.boss= boss
    end

    def boss=(node)
        if node != nil
            @boss.employees.delete(self) if @boss != nil
            @boss = node
            node.employees << self
        else
            @boss = nil
        end
    end

    def bonus(multiplier)
        (salary) * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, salary, title, boss=nil, employees)
        super(name, salary, title, boss)
        @employees = employees
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
            if employee.employees.empty?
                total_pay += employee.employees_salaries
            end
            total_pay += employee.salary 
        end
        total_pay 
    end

    def bonus(multiplier)
        employees_salaries * multiplier
    end

end

p ned = Manager.new("ned",1000000, "founder",['darren'])
p darren = Manager.new("darren",78000,"ta_manager", ['shawna', 'david'], ned)
p shawna = Employee.new("shawna",12000,"ta",darren)
p david = Employee.new("david",10000,"ta",darren)

p ned.employees_salaries
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

# p ned = Employee.new("ned",1000000, "founder")
# p darren = Employee.new("darren",78000,"ta_manager","ned")
# p shawna = Employee.new("shawna",12000,"ta","darren")
# p david = Employee.new("david",10000,"ta","darren")

# p ned.employees_salaries

