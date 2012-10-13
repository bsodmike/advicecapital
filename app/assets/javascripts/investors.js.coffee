jQuery ->
  if $('#stocks_chart').length
    Morris.Line
      element: 'stocks_chart'
      data: $('#stocks_chart').data('stocks')
      xkey: 'date'
      ykeys: ['value']
      labels: ['Værdi']
      parseTime: true
      # custom label formatting with `xLabelFormat`
      xLabelFormat: (d) ->
        d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear()
      hideHover: true

      # setting `xLabels` is recommended when using xLabelFormat
      xLabels: "day"

      dateFormat: (x) ->
        x.getDate()

    Morris.Line
      element: 'stocks_chart_current_year'
      data: $('#stocks_chart_current_year').data('stocks')
      xkey: 'date'
      ykeys: ['value']
      labels: ['Værdi']
      parseTime: true
      # custom label formatting with `xLabelFormat`
      xLabelFormat: (d) ->
        d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear()
      hideHover: true

      # setting `xLabels` is recommended when using xLabelFormat
      xLabels: "day"

      dateFormat: (x) ->
        x.getDate()