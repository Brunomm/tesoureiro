# encoding: UTF-8

require 'test_helper'

class CaixaTest < ActiveSupport::TestCase
	setup do
		@cx = caixas(:pessoal)
	end
	
	test "o nome é obrigatorio" do
		atributo_obrigatorio(@cx, :nome)
	end
	
	test "deve ter várias transacoes" do
		assert_respond_to(@cx, :transacoes)
	end
	
	test "deve ter um saldo" do
		assert_respond_to(@cx, :saldo)
	end
	
	test "valor do saldo" do
		cx_pessoal = caixas(:pessoal)
		assert_equal(0.00,    cx_pessoal.saldo(Date.new(2012,01,06)), "pessoal: o saldo em 06/01/2012 deveria ser 0")
		assert_equal(3000.00, cx_pessoal.saldo(Date.new(2012,1,7)),   "pessoal: o saldo em 7/1/2012 deveria ser 3000.00")
		assert_equal(2850.00, cx_pessoal.saldo(Date.new(2012,1,8)),   "pessoal: o saldo em 8/1/2012 deveria ser 2850.00")
		assert_equal(270.00,  cx_pessoal.saldo(Date.new(2012,1,21)),  "pessoal: o saldo em 21/1/2012 deveria ser 270")
		assert_equal(270.00, cx_pessoal.saldo(Date.new(2012,2,10)),   "pessoal: o saldo em 10/2/2012 deveria ser 270.00 pois nao pode considerar as previstas")
		assert_equal(270.00, cx_pessoal.saldo(Date.new(2012,2,15)),   "pessoal: o saldo em 15/2/2012 deveria ser 270.00 pois nao pode considerar as previstas")
		
		cx_oren = caixas(:oren)
		assert_equal(0.00,    cx_oren.saldo(Date.new(2012,1,9)),  "oren: o saldo em 9/1/2012 deveria ser 0.00")
		assert_equal(4000.00, cx_oren.saldo(Date.new(2012,1,10)), "oren: o saldo em 10/1/2012 deveria ser 4000.00")
		assert_equal(3831.00, cx_oren.saldo(Date.new(2012,1,12)), "oren: o saldo em 12/1/2012 deveria ser 3831.00")
		assert_equal(4409.04, cx_oren.saldo(Date.new(2012,2,7)),  "oren: o saldo em 7/2/2012 deveria ser 4409.04")
	end
	
	test "deve considerar o saldo previsto" do
		cx_pessoal = caixas(:pessoal)
		
		assert_equal(3270.00, cx_pessoal.saldo(Date.new(2012,2,10), previsto: true), "o saldo previsto em 10/2/2012 deveria ser 3270.00")
		assert_equal(1130.00, cx_pessoal.saldo(Date.new(2012,2,15), previsto: true), "o saldo previsto em 15/2/2012 deveria ser 1130.00")
		
		cx_oren = caixas(:oren)
		assert_equal(4409.04, cx_oren.saldo(Date.new(2012,2,7)), "o saldo em 7/2/2012 deveria ser 278.04")
		assert_equal(3531.00, cx_oren.saldo(Date.new(2012,2,10), previsto: true), "o saldo previsto em 7/2/2012 deveria ser 3531.00 ")
	end
end
