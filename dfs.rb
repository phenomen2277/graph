require_relative 'node.rb'
require_relative 'graph.rb'

class DFS
	def initialize
		@result = Array.new
	end

	def dfs(graph, start_node)
		raise TypeError unless start_node.class.ancestors.include?(Node)
		node = graph.nodes[start_node.name]
		raise RuntimeError if node == nil

		@result.push(node)
		node.successors.each do |s|
			dfs(graph, s) if @result.include?(s) == false
		end

		return @result
	end

	def dfs_the_whole_graph(graph)
		@result.clear

		graph.nodes.values.each do |n|
			dfs(graph, n) if @result.include?(n) == false
		end
	end
end