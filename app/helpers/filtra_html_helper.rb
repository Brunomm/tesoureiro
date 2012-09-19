module FiltraHtmlHelper
	
	# Este helper cria um input para filtrar elementos html na tela.
	# 
	# *seletor*: É o seletor CSS utilizado para encontrar os elementos no html;
	# *options*: Qualquer outra propriedade opcao html que ache necessária.
	# *options[:watermark]*: Adiciona um watermark no input;
	# 
	# Exemplo:
	# 	filtra_html('div.indice div.item', style: 'width: 500px; background:red;')
	def filtra_html(seletor, options)
		
		options.reverse_merge!({ id: 'filtra_html'})
		
		options.merge!({ class: 'filtra_html', autocomplete: 'off',
			onkeyup: " $('#{seletor}').hide(); $('#{seletor}:containsI(\"'+$(this).val()+'\")').show(); #{options[:onkeyup]}" })
		
		watermark = options[:watermark] ? javascript_tag("$('##{options[:id]}').watermark('#{options[:watermark]}');") : ''
		
		text_field_tag(options[:id],'',options) + watermark
	end
end