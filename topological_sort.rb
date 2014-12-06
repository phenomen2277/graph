require_relative 'node.rb'
require_relative 'graph.rb'
require_relative 'graph_utils.rb'

class TopologicalSort
	def initialize
		@visisted_nodes = Array.new
		@list = Array.new
	end

	def topological_sort(graph, start_node)
		raise RuntimeError, "The graph is cyclic" if GraphUtils.cyclic?(graph)
		node = graph.get_node_by_name(start_node.name)
		raise RuntimeError if node.nil?

		@visisted_nodes.clear if @visisted_nodes.size > 0
		@list.clear if @list.size > 0

		recursive_topological_sort(node)
		@list
	end

	private
	def recursive_topological_sort(start_node)
		@visisted_nodes.push(start_node)
		start_node.successors.values.each do |n|
			recursive_topological_sort(n) unless @visisted_nodes.include?(n)
		end

		@list.insert(0, start_node)
	end
end