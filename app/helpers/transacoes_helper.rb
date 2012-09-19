module TransacoesHelper
	def colore_valor(valor)
		"<font color='#{valor < 0 ? :red : :blue}'>#{valor.reais}</font>".html_safe
	end
end
