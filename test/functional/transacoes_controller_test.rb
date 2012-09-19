# encoding: UTF-8

require 'test_helper'

class TransacoesControllerTest < ActionController::TestCase

	setup do
		@trn = transacoes(:um)
	end

	test "deve ter o index" do
		get(:index)
		assert_response(:success)
		assert_not_nil(assigns(:transacoes))
		#deve estar ordenado por data
		assigns(:transacoes).each_slice(2) do |a,b|
			assert(a.data <= b.data, " a:#{a.data} > b:#{b.data}!") if (a && b)
		end
	end

	test "deve ter o new" do
		get(:new)
		assert_response(:success)
	end

	test "Deve inserir" do
		assert_difference('Transacao.count') do
			post(:create, transacao: @trn.attributes)
		end
		assert_redirected_to(transacoes_path(caixa: @trn.caixa))
	end

	test "deve exibir o editar" do
		get(:edit, id: @trn)
		assert_response(:success)
	end

	test "deve atualizar uma transacao" do
		put(:update, id: @trn, transacao: @trn.attributes)
		assert_redirected_to(transacoes_path(caixa: @trn.caixa))
	end

	test "Deve eliminar a transacao" do
		assert_difference('Transacao.count', -1) do
			delete(:destroy, id: @trn)
		end
		assert_redirected_to(transacoes_path)
	end
	
	test "inserir várias transações" do
		assert_difference("Transacao.count", +6) do
		  post(:create, {transacao: @trn.attributes, repetir: {proximos_meses: 5}})
		end
		assert_redirected_to(transacoes_path(caixa: @trn.caixa))
	end
	
	test "abre o new já com um caixa" do
		get(:new,{'transacao' => {'caixa_id' => @trn.caixa_id}})
		assert_equal(@trn.caixa, assigns(:transacao).caixa)
	end
	
	test "abre o new com um valor de transacao" do
		get(:new,{'transacao' => {'valor' => "45.02"}})
		assert_equal(45.02, assigns(:transacao).valor)
	end
end
