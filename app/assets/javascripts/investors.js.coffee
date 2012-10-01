jQuery ->
  Morris.Line
    element: 'stocks_chart'
    data: $('#stocks_chart').data('stocks')
    xkey: 'date'
    ykeys: ['value']
    labels: ['Værdi']
    parseTime: true
    # custom label formatting with `xLabelFormat`
    #xLabelFormat: (d) ->
      #d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear()


    # setting `xLabels` is recommended when using xLabelFormat
    xLabels: "day"

    #dateFormat: (x) ->
      #new Date(x).toDateString()