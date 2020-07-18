# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.chartColors = ->
  red: "#FF0000",
  blue: "#00FF00"

  color = Chart.helpers.color;



window.myScatter2 = (result)->
    ctx = document.getElementById('myChart2').getContext('2d');
    color = Chart.helpers.color;
    aaa = [{x:-0.59,y:1.243},{x:-1.166,y:0.881}]
    console.log(result.resultx);
    console.log(result.resulty);
    x_cords = result.resultx;
    y_cords = result.resulty;
    array = new Array();
    array.push({x:x_cords[i], y:y_cords[i]}) for i in [0 .. 35]
    scatter_data = {
        datasets:[{
            label: "単語名",
            borderColor: "rgba(0,0,0,0.6)",
            backgroundColor: "rgba(191,255,0,0.6)",
            pointRadius: 10,
            data: array
        }]
    };
    onomatopoeia = ["さらさら", "すべすべ", "つるつる", "でこぼこ", "がさがさ", "ざらざら", "ふわふわ", "ぶわぶわ", "ぶよぶよ", "ぷるぷる", "ぐにゃぐにゃ", "ふかふか", "ふにゃふにゃ", "むちむち", "ごつごつ", "ごわごわ", "かちかち", "べたべ た", "べとべと", "べちょべちょ", "びしょびしょ", "びちゃびちゃ", "ぐしょぐしょ", "じくじく", "ぼそぼそ", "ぽそ ぽそ", "かさかさ", "ぱさぱさ", "ねばねば", "ねちねち", "ねとねと", "ねちゃねちゃ", "ぬめぬめ", "ぬるぬる", "に ゅるにゅる", "ぎとぎと"]
    myChart = new Chart.Scatter(ctx, {
        data: scatter_data,
        options:{
            title: {
            display: true,
            text: "オノマトペの認知(あなたの結果)"
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

window.myScatter1 = ->
    ctx = document.getElementById('myChart1').getContext('2d');
    color = Chart.helpers.color;
    scatter_data = {
        datasets:[{
            label: "単語名",
            borderColor: "rgba(0,0,0,0.6)",
            backgroundColor: "rgba(253,113,102,0.6)",
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
            text: "オノマトペの認知(全体平均)"
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
