require 'mds'
require 'mds/interfaces/gsl_interface'
require 'gnuplot'

#MDS::Backend.try_require
#MDS::Backend.active = MDS::Backend.first
#puts "Using backend #{MDS::Backend.active}"
#MDS::Backend.interface = MDS::GSLInterfacea
#MDS::Backend.try_require
ind = [{x:-0.59,y:1.243}, {x:-1.166,y:0.881}, {x:-0.999,y:0.088}, {x:-0.138,y:-0.078},
 {x:-0.738,y:-1.88}, {x:-0.944,y:-1.486}, {x:-0.388,y:-0.487}, {x:-0.594,y:-0.093},
 {x:-0.837,y:-0.76}, {x:0.261,y:-1.015}, {x:-2.379,y:-0.645}, {x:-0.003,y:-1.124},
 {x:-1.733,y:0.421}, {x:1.789,y:-0.089}, {x:1.696,y:0.424}, {x:0.803,y:0.284},
 {x:1.102,y:-0.623}, {x:1.238,y:0.936}, {x:0.161,y:-0.985}, {x:-1.051,y:0.419}, 
{x:-0.569,y:0.606}, {x:0.0,y:0.212}, {x:-0.607,y:0.286}, {x:0.896,y:-0.229}, 
{x:0.762,y:0.817}, {x:1.132,y:1.573}, {x:1.146,y:0.18}, {x:0.896,y:-0.229}, 
{x:1.366,y:-0.593}, {x:1.486,y:-1.259}, {x:1.16,y:-0.199}, {x:-2.05,y:0.644}, 
{x:1.073,y:1.069}, {x:0.233,y:0.678}, {x:-2.394,y:0.747}, {x:-0.018,y:0.269}]

#p ind[0][:x]
#p ind.length
count = 0
distance_array = Array.new(36) do 
    Array.new(36,0)
end
#p distance_array.flatten.length

36.times do |i| #0~35
    x1 = ind[i][:x]
    y1 = ind[i][:y]
    #35.times do |j|#1~35
    36.times do |j| #0~34
        if i == j
            next
        end
        x2 = ind[j][:x]
        y2 = ind[j][:y]
        dist = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2).round(3)
        distance_array[i][j] = dist
    end
end
#p distance_array[1].join(",")

=begin
File.open("dist.csv","w") do |f|
    distance_array.each do |s| 
        f << s.join(",")
        f << "\n"
    end
end
=end

distance_array.length.times do |i|
    (i+1).times do |t|
        distance_array[i].shift
    end
end

#p distance_array
=begin
File.open("dist1half.csv","w") do |f|
    distance_array.each do |s| 
        f << s.join(",")
        f << "\n"
    end
end
=end

avg = [{x:-3.581,y:-3.874},{x:-2.526,y:-3.733},{x:-2.002,y:-2.795},{x:-4.024,y:1.656},
{x:-3.989,y:2.083},{x:-3.844,y:2.405},{x:-0.233,y:-2.771},{x:-0.903,y:-0.356},
{x:1.161,y:-0.5},{x:1.814,y:-2.426},{x:1.736,y:-0.893},{x:-1.52,y:-3.401},
{x:0.299,y:-1.581},{x:1.618,y:-1.573},{x:-3.912,y:2.465},{x:-3.375,y:2.139},
{x:-3.868,y:-0.434},{x:2.515,y:1.314},{x:2.965,y:1.504},{x:3.054,y:0.815},
{x:1.995,y:0.342},{x:2.621,y:0.732},{x:2.676,y:0.741},{x:0.591,y:1.213},
{x:-2.019,y:0.976},{x:-1.764,y:0.295},{x:-3.82,y:1.141},{x:-3.344,y:0.887},
{x:2.806,y:0.363},{x:2.437,y:0.15},{x:2.622,y:0.628},{x:3.198,y:0.457},
{x:3.298,y:0.671},{x:3.19,y:-0.068},{x:2.693,y:-0.281},{x:1.437,y:1.708}]


distance_array2 = Array.new(36) do 
    Array.new(36,0)
end
#p distance_array.flatten.length

36.times do |i| #0~35
    x1 = avg[i][:x]
    y1 = avg[i][:y]
    #35.times do |j|#1~35
    36.times do |j| #0~34
        if i == j
            next
        end
        x2 = avg[j][:x]
        y2 = avg[j][:y]
        dist = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2).round(3)
        distance_array2[i][j] = dist
    end
end
distance_array2.length.times do |i|
    (i+1).times do |t|
        distance_array2[i].shift
    end
end
#p distance_array2
#p distance_array2.flatten.length

p distance_array2.flatten
File.open("dist2half.csv","w") do |f|
    distance_array2.each do |s| 
        f << s.join(",")
        f << "\n"
    end
end
