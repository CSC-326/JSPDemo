<html>
<head><title>First JSP</title></head>
<body>
  <%
    double num = Math.random();
    if (num > 0.95) {
  %>
      <h2>You'll have a luck day!</h2><p>(<%= num %>)</p>
  <%
    } else {
  %>
      <h2>Well, life goes on ... </h2><p>(<%= num %>)</p>
  <%
    }
  %>
  
  <img src="/JSPDemo/chart" />
  
  <a href="<%= request.getRequestURI() %>"><h3>Try Again</h3></a>
  
  <h3>Highcharts Version</h3>
  
  <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
  
  <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script>
	  $.getJSON("/JSPDemo/api/users/10", function(data) 
	   {
		  var days = [];
		  for( var i = 0; i < data.Weights.length; i++ )
		  {
			  days.push(data.Weights[i].date);
		  }
		  var weights = [];
		  for( var i = 0; i < data.Weights.length; i++ )
		  {
			  weights.push(data.Weights[i].weight);
		  }
		  console.log( weights )
		  $('#container').highcharts(
		  {
			title: { text: "Chart for patient #" + data.user },
			xAxis: {categories: days},
			series: 
				[
				  {
					name: "weight",
				  	data: weights
				  }
				]
		  });	  
	   });
  </script>

  
</body>
</html>