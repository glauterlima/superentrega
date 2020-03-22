class CreateServicos < ActiveRecord::Migration[5.2]
  def change
    create_table :servicos do |t|
      t.string :foto
      t.string :nome
      t.string :cidade
      t.text :descricao
      t.string :localentrega
      t.string :telefone
      t.string :celular
      t.string :email

      t.timestamps
    end
  end
end
