class CreateCaixas < ActiveRecord::Migration
	def change
		create_table :caixas do |t|
			t.string :nome, null: false
			t.timestamps
		end
		add_column(:transacoes, :caixa_id, :integer, null: false, default: 0)
	end
end
