require_relative 'node.rb'
require_relative 'graph.rb'

class DFS
	def initialize
		@result = Array.new
	end

	def dfs(graph, start_node)
		raise TypeError unless graph.class.ancestors.include?(Graph§)
		raise TypeError unless start_node.class.ancestors.include?(Node)
		node = graph.get_node_by_name(start_node.name)
		raise RuntimeError if node == nil
		@result.clear if @result.size > 0

		recursive_dfs(graph, node)

		return @result
	end

	private
	def recursive_dfs(graph, node)
		@result.push(node)
		node.successors.each do |s|
			recursive_dfs(graph, s) if @result.include?(s) == false
		end
	end

end