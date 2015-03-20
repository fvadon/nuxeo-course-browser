 <@extends src="base.ftl"> <@block name="title"> Region selector
</@block> <@block name="content">
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<a href="${This.path}/region/california" class="btn btn-primary btn-lg btn-block">California</a>
		</div>
		<div class="col-md-6">
			<a href="${This.path}/region/newyork" class="btn btn-primary btn-lg btn-block">New York</a>
		</div>
	</div>
</div>
</@block> </@extends>