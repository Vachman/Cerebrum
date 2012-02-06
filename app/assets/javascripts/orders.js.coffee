@get_services = (obj) ->
	category = obj.options[obj.value].text
	escaped_category = category.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
	alert category
	



