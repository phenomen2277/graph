require_relative 'node.rb'
require_relative 'graph.rb'

class PostOrder
	def initialize
		@visisted_nodes = Array.new
		@list = Array.new
	end

	def post_order(graph, start_node)
		raise TypeError unless start_node.class.ancestors.include?(Node)
		
		@visisted_nodes.clear if @visisted_nodes.size > 0
		@list.clear if @list.size > 0

		recursive_post_order(graph, start_node)
	end

	private 
	def recursive_post_order(graph, start_node)
		node = graph.nodes[start_node.name]
		raise RutimeError if  start_node == nil
		
		@visisted_nodes.push(node)
		start_node.successors.each do |n|
			recursive_post_order(graph, n) if @visisted_nodes.include?(n) == false
		end

		@list.push(start_node)
		@list
	end
end