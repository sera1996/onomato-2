require 'pca'
require 'gnuplot'
require 'json'

rows = File.readlines("./total_avg.csv").map {|l| l.chomp.split(',')}
#p rows
#puts rows
#a = Array.new(7) do
#    Array.new(36)
#end
#p a
x_data = rows.map{|row| row[1,8].map(&:to_f)}
#p x_data
labels = rows.map{|row| row[0]} 

pca = PCA.new components:2
transformed = pca.fit_transform x_data
transformed = transformed.to_a

#p transformed
#p labels
float_round = Array.new(36) do
    [0,0]
end

float_round_x = []
float_round_y = []
#p float_round
transformed.each_with_index do |row,i|
    row.each_with_index do |column,j|
        if j == 0
            float_round_x.push(column.round(3)*-1)
        elsif j == 1
            float_round_y.push(column.round(3)*-1)
        end
    end
end
#json_obj = []
result = []
#float_round.each do |float|
#    json_obj << float.to_json
#end
float_round_x.each_with_index do |data,i|
    result.push("{x:#{data},y:#{float_round_y[i]}}")
end
res = result.join(",")
#p res
#p res
#data = float_round_x.map.with_index{|num,i| [{x: num, y: float_round_y[i]}]}
#p float_round_x
#p float_round_y
#p data        
#puts "explained_variance_ratio: #{pca.explained_variance_ratio.to_a.map {|v| v.round(4)}}"
#puts "Total EVR=#{pca.explained_variance_ratio.sum}"