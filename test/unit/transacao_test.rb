# encoding: UTF-8

require 'test_helper'

class TransacaoTest < ActiveSupport::TestCase
	setup do
		@trn = transacoes(:um)
	end
	
	test "atributos obrigatórios" do
		atributo_obrigatorio(@trn, :data, :descricao, :valor, :realizada, :caixa_id)
	end

	test "metodo previsto" do
		assert_respond_to(@trn,:prevista?)
		assert_equal(false, @trn.prevista?)
		assert_equal(true, @trn.realizada?)
	end
	
	test "uma transação nao pode ter o valor 0" do
		@trn.valor = 0.00
		assert(!@trn.save)
	end
	
	test "deve responder a um caixa" do
		assert_respond_to(@trn, :caixa)
	end
	
	test "deve ter um caixa que exista" do
		@trn.caixa_id = 9999
		assert(!@trn.save)
	end
	
	test "deve criar uma transacao nao realizada" do
		@trn.realizada = false
		assert(@trn.save)
	end
end
