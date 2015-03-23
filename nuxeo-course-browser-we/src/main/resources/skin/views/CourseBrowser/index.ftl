 <@extends src="base.ftl"> <@block name="title"> Region selector
</@block> 
<@block name="stylesheets">
  <style type="text/css">
      body {
        padding-top: 20px;
      }
  </style>
</@block>

<@block name="content">
<div class="container">
	<div class="jumbotron">
		<h2>Course browser</h2>
		<p>Please select a region</p>
	</div>
	<div class="row-fluid">
		<div class="col-md-6">
			<a href="${This.path}/region/california" class="btn btn-primary btn-lg btn-block">California</a>
		</div>
		<div class="col-md-6">
			<a href="${This.path}/region/newyork" class="btn btn-warning btn-lg btn-block">New York</a>
		</div>
	</div>
</div>
</@block> </@extends>