# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###
window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })
###
window.chartColors = ->
  red: "#FF0000",
  blue: "#00FF00"

  color = Chart.helpers.color;



window.myScatter1 = ->
    ctx = document.getElementById('myChart1').getContext('2d');
    color = Chart.helpers.color;
    scatter_data = {
        datasets:[{
            label: "単語名",
            borderColor: "rgba(0,0,0,0.6)",
            backgroundColor: ["rgba(253,113,102,0.6)"],
            pointRadius: 10,

            data: [
                {x:-3.581,y:-3.874},
                {x:-2.526,y:-3.733},
                {x:-2.002,y:-2.795},
                {x:-4.024,y:1.656},
                {x:-3.989,y:2.083},
                {x:-3.844,y:2.405},
                {x:-0.233,y:-2.771},
                {x:-0.903,y:-0.356},
                {x:1.161,y:-0.5},
                {x:1.814,y:-2.426},
                {x:1.736,y:-0.893},
                {x:-1.52,y:-3.401},
                {x:0.299,y:-1.581},
                {x:1.618,y:-1.573},
                {x:-3.912,y:2.465},
                {x:-3.375,y:2.139},
                {x:-3.868,y:-0.434},
                {x:2.515,y:1.314},
                {x:2.965,y:1.504},
                {x:3.054,y:0.815},
                {x:1.995,y:0.342},
                {x:2.621,y:0.732},
                {x:2.676,y:0.741},
                {x:0.591,y:1.213},
                {x:-2.019,y:0.976},
                {x:-1.764,y:0.295},
                {x:-3.82,y:1.141},
                {x:-3.344,y:0.887},
                {x:2.806,y:0.363},
                {x:2.437,y:0.15},
                {x:2.622,y:0.628},
                {x:3.198,y:0.457},
                {x:3.298,y:0.671},
                {x:3.19,y:-0.068},
                {x:2.693,y:-0.281},
                {x:1.437,y:1.708}]

        }]
    };
    onomatopoeia = ["さらさら", "すべすべ", "つるつる", "でこぼこ", "がさがさ", "ざらざら", "ふわふわ", "ぶわぶわ", "ぶよぶよ", "ぷるぷる", "ぐにゃぐにゃ", "ふかふか", "ふにゃふにゃ", "むちむち", "ごつごつ", "ごわごわ", "かちかち", "べたべ た", "べとべと", "べちょべちょ", "びしょびしょ", "びちゃびちゃ", "ぐしょぐしょ", "じくじく", "ぼそぼそ", "ぽそ ぽそ", "かさかさ", "ぱさぱさ", "ねばねば", "ねちねち", "ねとねと", "ねちゃねちゃ", "ぬめぬめ", "ぬるぬる", "に ゅるにゅる", "ぎとぎと"]
    myChart = new Chart.Scatter(ctx, {
        data: scatter_data,
        options:{
            title: {
            display: true,
            text: "オノマトペ関係性グラフ"
            },
            tooltips: {
                callbacks:{
                    label: (tooltipItem,data) ->
                        label = data.datasets[tooltipItem.datasetIndex].label || '';
                        if label 
                            label += ': ';
                        label = onomatopoeia[tooltipItem.index];
                        #console.log(data.datasets[tooltipItem.datasetIndex]);
                        return label;
                }
            }
        }
});
