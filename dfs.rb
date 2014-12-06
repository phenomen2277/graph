require_relative 'node.rb'
require_relative 'graph.rb'

class DFS
	def initialize
		@result = Hash.new
	end

	def dfs(graph, start_node)
		node = graph.get_node_by_name(start_node.name)
		raise RuntimeError if node.nil?

		@result.clear if @result.size > 0

		recursive_dfs(node)
		@result.values
	end

	private
	def recursive_dfs(node)
		@result[node.name] = node
		node.successors.values.each do |s|
			recursive_dfs(s) if @result[s.name].nil?
		end
	end

end