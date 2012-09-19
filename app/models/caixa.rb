class Caixa < ActiveRecord::Base
	has_many :transacoes
	
	validates :nome, presence: true
	
	def saldo(em=Date.today, params={})
		trns = self.transacoes.where(['data <= ?', em])
		trns = trns.realizadas unless params[:previsto]
		return trns.sum(:valor)
	end
end
