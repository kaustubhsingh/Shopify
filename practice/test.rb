arr = (1..10000).to_a.select { |i| i%3 == 0}
					.select { |i| i >= 5000}
					.sort {|i, j| j <=>i}
p arr