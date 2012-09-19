class TransacoesController < ApplicationController
	include Crud
	
	def index
		@caixas = Caixa.all
		@transacoes = Transacao.order(:data)
		@pisca = Transacao.find(params[:pisca]) if params[:pisca]
	end
	
	def new
		super 
		
		if params[:transacao]
			@transacao.caixa_id = params[:transacao][:caixa_id]
			@transacao.valor = params[:transacao][:valor].to_f
		end
	end
	
	def update
		busca_registro()
		
		if @registro.update_attributes(params[@nome_singular.to_sym])
			cria_repeticoes()
			redirect_to(transacoes_path(caixa: @transacao.caixa_id, pisca: @transacao.id))
		else
			render(action: :edit)
		end
	end
	
	def create
		@transacao = Transacao.new(params[:transacao])
		
		if @transacao.save
			cria_repeticoes()
			redirect_to(transacoes_path(caixa: @transacao.caixa_id, pisca: @transacao.id))
		else
			render(action: :edit)
		end
	end
	
	private
	
	def cria_repeticoes
		if params[:repetir] && !params[:repetir][:proximos_meses].to_i.zero?
			params[:repetir][:proximos_meses].to_i.times do |i|
				trn = Transacao.new(params[:transacao])
				trn.data = trn.data + (i + 1).month
				trn.save!
			end
		end
	end
end
