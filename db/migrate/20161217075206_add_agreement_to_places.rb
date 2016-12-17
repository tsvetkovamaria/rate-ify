class AddAgreementToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :agreement, :boolean
  end
end
