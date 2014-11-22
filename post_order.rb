require_relative 'node.rb'
require_relative 'graph.rb'

class PostOrder
	def initialize
		@visisted_nodes = Array.new
		@list = Array.new
	end

	def post_order(graph, start_node)
		raise TypeError unless graph.class.ancestors.include?(Graph)
		raise TypeError unless start_node.class.ancestors.include?(Node)
		node = graph.get_node_by_name(start_node.name)
		raise RuntimeError if node == nil

		@visisted_nodes.clear if @visisted_nodes.size > 0
		@list.clear if @list.size > 0

		recursive_post_order(node)
		return @list
	end

	private 
	def recursive_post_order(start_node)
		@visisted_nodes.push(start_node)
		start_node.successors.each do |n|
			recursive_post_order(graph, n) if @visisted_nodes.include?(n) == false
		end

		@list.push(start_node)
	end
end