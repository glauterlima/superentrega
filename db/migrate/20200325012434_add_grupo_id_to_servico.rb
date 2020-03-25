class AddGrupoIdToServico < ActiveRecord::Migration[5.2]
  def change
    add_column :servicos, :grupo_id, :integer
  end
end
