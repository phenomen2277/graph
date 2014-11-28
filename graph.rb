require_relative 'node.rb'
class Graph
	attr_accessor :nodes
	def initialize
		@nodes = Array.new
	end

	def add_node(node)
		raise_type_error_when_instance_is_not_node(node)
		@nodes.push(node) unless @nodes.include?(node)
	end

	def get_node_by_name(name)
		@nodes.each do |n|
			return n if n.name == name
		end
		nil
	end

	def remove_node(node)
		raise_type_error_when_instance_is_not_node(node)
		@nodes.delete(node)

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

		fromNode = get_node_by_name(from_node.name)
		toNode = get_node_by_name(to_node.name)
		
		if fromNode.nil?
			fromNode = from_node
			@nodes.push(fromNode)

		end

		if toNode.nil?
			toNode = to_node
			@nodes.push(toNode)
		end

		fromNode.add_successor(toNode)
		toNode.add_predecessor(fromNode)
	end

	private 
	def raise_type_error_when_instance_is_not_node(object)
		raise TypeError unless object.class.ancestors.include?(Node)
	end 
end
