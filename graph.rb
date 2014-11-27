require_relative 'node.rb'
class Graph
	attr_accessor :nodes
	def initialize
		@nodes = Hash.new
	end

	def add_node(node)
		raise_type_error_when_instance_is_not_node(node)
		@nodes.store(node.name, node)
	end

	def get_node_by_name(name)
		return @nodes[name]
	end

	def remove_node(node)
		raise_type_error_when_instance_is_not_node(node)
		@nodes.delete(node.name)

		@nodes.each do |n|
			n.remove_successor(node)
			n.remove_predecessor(node)
		end
	end

	def remove_edge(from_node, to_node)
		raise_type_error_when_instance_is_not_node(from_node)
		raise_type_error_when_instance_is_not_node(to_node)

		from_node.remove_successor(to_node)
		to_node.remove_predecessor(from_node)
	end

	def add_edge(from_node, to_node)
		raise_type_error_when_instance_is_not_node(from_node)
		raise_type_error_when_instance_is_not_node(to_node)

		fromNode = @nodes[from_node.name]
		toNode = @nodes[to_node.name]
		
		if fromNode.nil?
			fromNode = from_node
			@nodes.store(fromNode.name, fromNode)

		end

		if toNode.nil?
			toNode = to_node
			@nodes.store(toNode.name, toNode)
		end

		fromNode.add_successor(toNode)
		toNode.add_predecessor(fromNode)
	end

	private 
	def raise_type_error_when_instance_is_not_node(object)
		raise TypeError unless object.class.ancestors.include?(Node)
	end 
end
