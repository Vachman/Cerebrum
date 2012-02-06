@get_services = (val) ->
	category = $(val).html()
	alert category
	
$(".service_category").change ->
	alert "Fuck"	


