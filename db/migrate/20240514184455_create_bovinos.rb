class CreateBovinos < ActiveRecord::Migration[7.1]
  def change
    create_table :bovinos do |t|
      t.string :brinco
      t.string :nome
      t.string :situacao
      t.string :sexo
      t.string :brinco_mae
      t.string :brinco_pai
      t.string :raca
      t.date :data_nascimento
      t.date :data_prenhes
      t.date :data_ultimo_parto

      t.timestamps
    end
  end
end
