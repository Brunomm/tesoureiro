module FlechaEscondeInformacaoHelper

	def flecha_esconde_informacao(seletor,params)

		params.reverse_merge!({
			id: 'controle_flecha_esconde_informacao',
			expande_id: 'expande',
			recolhe_id: 'recolhe',
			ao_expandir: '',
			ao_recolher: ''
		})
		
		render(partial: "layouts/flecha_esconde_informacao", locals: {seletor: seletor, params: params})
		
		end
	end