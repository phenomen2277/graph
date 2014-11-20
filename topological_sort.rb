require_relative 'node.rb'
require_relative 'graph.rb'
require_relative 'graph_utils.rb'

class TopologicalSort
	def initialize
		@visisted_nodes = Array.new
		@list = Array.new
	end

	def topological_sort(graph, start_node)
		raise TypeError unless start_node.class.ancestors.include?(Node)
		raise RuntimeError, "The graph is cyclic" if GraphUtils.is_cyclic(graph)

		@visisted_nodes.clear if @visisted_nodes.size > 0
		@list.clear if @list.size > 0

		recursive_topological_sort(graph, start_node)
	end

	private
	def recursive_topological_sort(graph, start_node)
		node = graph.nodes[start_node.name]
		raise RutimeError if  start_node == nil
		
		@visisted_nodes.push(node)
		start_node.successors.each do |n|
			recursive_topological_sort(graph, n) if @visisted_nodes.include?(n) == false
		end

		@list.insert(0, start_node)
		@list
	end
end