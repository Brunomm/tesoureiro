ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
	#
	# Note: You'll currently still have to declare fixtures explicitly in integration tests
	# -- they do not yet inherit this setting
	fixtures :all
	
	def atributo_obrigatorio(objeto,*atributos)
		atributos.each do |att|
			
			valor_preenchido = objeto.send(att)
			
			objeto.send("#{att}=",nil)
			assert(!objeto.save,"Salvou o objeto mesmo com o atributo '#{att}' nulo!")
			
			objeto.send("#{att}=",valor_preenchido)
		end
	end
end
