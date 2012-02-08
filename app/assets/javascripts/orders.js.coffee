jQuery ->
	services = ''
	$(".order_services").bind "DOMSubtreeModified", ->
		$('.service_select').last().parent().hide()
		if services == ''
			services = $('.service_select').last().html()
		$(".category_select").change ->
			category_selector = this
			category = $(':selected',category_selector).text()
			escaped_category = category.replace(/([#;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
			options = $(services).filter("optgroup[label='#{escaped_category}']").html()
			cat_sel = $(category_selector).parent().parent()
			if options
				$('.service_select', cat_sel).html(options)
				$('.service_select', cat_sel).parent().show()
			else
				$('.service_select', cat_sel).empty()
				$('.service_select', cat_sel).parent().hide()