require 'rubygems'
require 'mlp'
require 'data_frame'

IRIS = {1 => 'Iris Setosa', 2 => 'Iris Versicolour', 3 => 'Iris Virginica'}.freeze
KEYS = {'Iris-setosa' => 1, 'Iris-versicolor' => 2, 'Iris-virginica' => 3}.freeze

@mlp = MLP.new(:hidden_layers => [4], :output_nodes => 3, :inputs => 4)

@df = DataFrame.new(:sepal_length, :sepal_width, :petal_length, :petal_width, :class)
@df.import File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'iris', 'iris.data'))
@df.training_set # Takes 80% of the data randomly and makes it into a training set

@df.training_set.each do |row|
  e = row.dup
  key = [KEYS[e.pop]]
  @mlp.train(e, key)
end

# error_rate = test_set.map {|e| }
