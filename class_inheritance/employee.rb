require_relative "manager.rb"

class Employee 
    attr_reader :name, :salary, :title, :boss

    def initialize(name, salary, title, boss=nil)
        @name = name
        @salary = salary
        @title = title
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

    private
    def bonus(multiplier)
        (salary) * multiplier
    end


end


puts ned = Employee.new("ned",1000000, "founder")
# p darren = Employee.new("darren",78000,"ta_manager","ned")
# p shawna = Employee.new("shawna",12000,"ta","darren")
# p david = Employee.new("david",10000,"ta","darren")