require_relative "manager.rb"

class Employee
    attr_reader :name, :salary, :title, :boss
    def initialize(name, salary, title, boss=nil)
        @name = name
        @salary = salary
        @title = title
        @boss = boss
    end

    def bonus(multiplier)
        bonus = (salary) * multiplier
    end

    def boss=(node)
        if node! = nil
            @boss.employees.delete(self) if @boss != nil
            @boss = node
            node.employees << self
        else
            @boss = nil
        end
    end



end

def parent=(node)
    if node != nil
        @parent.children.delete(self) if @parent != nil
        @parent = node
        node.children << self
    else
        @parent = nil
    end
    # self
end