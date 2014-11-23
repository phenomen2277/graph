require_relative 'node.rb'
require_relative 'graph.rb'
require_relative 'dfs.rb'

class ConnectedComponents
	def initialize()
		@result = Array.new
	end


	def parse_components(graph)
		@result.clear if @result.size > 0
		parse(graph)
		@result
	end

	private

	def parse(graph)
		dfs = DFS.new
		graph.nodes.values.each do |n|
			if n.is_head?
				path = dfs.dfs(graph, n)
				push_to_result(path)
			end
		end
	end

	def push_to_result(path)
		exists = false
		@result.each do |item|
			exists = true if item.include?(path)
		end

		@result.push(path) unless exists
	end
end