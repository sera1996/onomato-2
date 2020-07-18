require 'pca'
require 'gnuplot'
require 'pca'

pca = PCA.new components: 1

data_2d = [ 
  [2.5, 2.4], [0.5, 0.7], [2.2, 2.9], [1.9, 2.2], [3.1, 3.0],
  [2.3, 2.7], [2.0, 1.6], [1.0, 1.1], [1.5, 1.6], [1.1, 0.9]
]

data_1d = pca.fit_transform data_2d

# Transforms 2d data into 1d:
# data_1d ~= [
#   [-0.8], [1.8], [-1.0], [-0.3], [-1.7],
#   [-0.9], [0.1], [1.1], [0.4], [1.2]
# ]

more_data_1d = pca.transform [ [3.1, 2.9] ]

# Transforms new data into previously fitted 1d space:
# more_data_1d ~= [ [-1.6] ]

reconstructed_2d = pca.inverse_transform data_1d

# Reconstructs original data (approximate, b/c data compression):
# reconstructed_2d ~= [
#   [2.4, 2.5], [0.6, 0.6], [2.5, 2.6], [2.0, 2.1], [2.9, 3.1]
#   [2.4, 2.6], [1.7, 1.8], [1.0, 1.1], [1.5, 1.6], [1.0, 1.0]
# ]

evr = pca.explained_variance_ratio

# Proportion of data variance explained by each component
# Here, the first component explains 99.85% of the data variance:
# evr ~= [0.99854]

#puts evr
pca = PCA.new components: 2
data_2d = pca.fit_transform reconstructed_2d

Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.title "Transformed Data"
    plot.terminal "png"
    plot.output "out.png"

    # Use #col accessor to get separate x and y arrays
    # #col returns a GSL::Vector, so be sure to call #to_a before passing to DataSet
    xy = [data_2d.col(0).to_a, data_2d.col(1).to_a]

    plot.data << Gnuplot::DataSet.new(xy) do |ds|
      ds.title = "Points"
    end
  end
end