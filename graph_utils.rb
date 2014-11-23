require_relative 'node.rb'
require_relative 'graph.rb'

class GraphUtils
	def self.is_cyclic?(graph)
		graph.nodes.values.each do |n1|
			graph.nodes.values.each do |n2|
				return true if n1.successors.include?(n2) && n2.successors.include?(n1)
			end
		end
		false
	end
end