class CreateTransacoes < ActiveRecord::Migration
	def change
		create_table :transacoes do |t|
			t.date :data, null: false
			t.string :descricao, null: false
			t.decimal :valor, null: false
			t.boolean :realizada, null: false
			
			t.timestamps
		end
	end
end
