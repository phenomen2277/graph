require 'set.rb'

class Node
	attr_accessor :name, :value
	attr_reader :successors, :predecessors

	def initialize(name, value = nil)
		@name = name
		@value = value
		@successors = Set.new
		@predecessors = Set.new
	end

	def head?()
		return true if @predecessors.size == 0
		return false
	end

	def tail?() 
		return true if @successors.size == 0
		return false
	end

	def add_successor(successor)
		raise_type_error_when_instance_is_not_node(successor)
		@successors.add?(successor)
	end

	def add_predecessor(predecessor)
		raise_type_error_when_instance_is_not_node(predecessor)
		@predecessors.add?(predecessor)
	end

	def remove_successor(successor)
		raise_type_error_when_instance_is_not_node(successor)
		@successors.delete?(successor)
	end

	def remove_predecessor(predecessor)
		raise_type_error_when_instance_is_not_node(predecessor)
		@predecessors.delete?(predecessor)
	end

	def has_successors?
		@successors.size > 0
	end

	def has_predecessors?
		@predecessors.size > 0
	end

	def to_s
		@name
	end

	def eql?(object)
		raise_type_error_when_instance_is_not_node(object)
		@name.eql?(object.name)
	end

	def hash
		@name.hash
	end

	def <=>(object)
		raise_type_error_when_instance_is_not_node(object)
		@name <=> object.name
	end

	def ==(object)	
		return @name == object.name if object.is_a?(Node)
	end
	
	private 
	def raise_type_error_when_instance_is_not_node(object)
		raise TypeError unless object.class.ancestors.include?(Node)
	end
end
