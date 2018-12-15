function initBarChart(meteoriteData){
  Highcharts.chart('barChartContainer', {
      chart: {
          type: 'bar',
          zoomType: 'x',
          panning: true,
          panKey: 'shift',
        scrollablePlotArea: {
            minWidth: 500,
            scrollPositionX: 1
        }

      },
      title: {
          text: 'Meteorite Fragment Sales Data'
      },
      xAxis: {
          categories: meteoriteData[0],
          title: {
              text: null
          }
      },
      yAxis: [{
            title: {
                text: 'Fragments Sold',
                align: 'left',
                y: -15,
                reserveSpace: false
            }
        }, {
            title: {
                text: 'Total Weight',
                align: 'left',
                y: -15,
                reserveSpace: false
            },
        }, {
            title: {
                text: 'Total Value',
                align: 'left',
                y: -15,
                reserveSpace: false
            },
        }],
      tooltip: {
          valueSuffix: ''
      },
      plotOptions: {
          bar: {
              dataLabels: {
                  enabled: true
              }
          }
      },
      legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'top',
          x: -40,
          y: 80,
          floating: true,
          borderWidth: 1,
          backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
          shadow: true
      },
      credits: {
          enabled: false
      },
      series: [{
          name: 'Total Fragments Sold',
          data: meteoriteData[1]
      }, {
          name: 'Total Weight Sold',
          data: meteoriteData[2],
          yAxis: 1
      }, {
          name: 'Total Cost',
          data: meteoriteData[3],
          yAxis: 2
      }]
  });
}
