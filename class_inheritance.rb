require 'byebug'

class Employee
	attr_accessor :name, :title, :salary, :boss

	def initialize(name, title, salary, boss)
		@name = name
		@title = title
		@salary = salary
		@boss = boss
	end

	def bonus(multiplier)
		if !self.is_a?(Manager)
			bonus =  self.salary * multiplier
			return bonus
		else
			queue = [self]

			total = 0

			while !queue.empty?
				shift = queue.shift
				if shift == self
					total += 0
					queue += shift.employees.flatten
				elsif shift.is_a?(Manager)
					queue += shift.employees.flatten
					total += shift.salary
				else
					total += shift.salary
				end
			end
			total * multiplier
		end
	end
end

class Manager < Employee
	attr_reader :employees
	def initialize(name, title, salary, boss)
		super
		@employees = []
	end

	def add_employee(employee)
		@employees << employee
		employee.boss = self
	end
end

a = Manager.new("Justin", "CEO", 250000, nil)
b = Manager.new("Greg", "Associate", 10000, nil)
c = Employee.new("Brian", "Associate", 10000, nil)
d = Employee.new("Tyler", "Associate", 10000, nil)
e = Employee.new("Nick", "Associate", 10000, nil)

a.add_employee(b)
a.add_employee(c)
b.add_employee(d)
b.add_employee(e)

p a.bonus(3)

