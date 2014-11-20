require_relative 'node.rb'
require_relative 'graph.rb'
require_relative 'dfs.rb'

class ConnectedComponents
	def initialize()
		@result = Array.new
	end


	def parse_components(graph)
		raise TypeError unless graph.class.ancestors.include?(Graph)
		
		graph.nodes.values.each do |n|
			if n.is_head?
				dfs = DFS.new
				path = dfs.dfs(graph, n)
				push_to_result(path)
			end
		end

		return @result
	end

	private
	def push_to_result(path)
		exists = false
		@result.each do |item|
			exists = true if item.include?(path)
		end

		@result.push(path) if exists == false
	end
end