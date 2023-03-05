class CreateGrammaticalConstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :grammatical_constructions do |t|
      t.string :level
      t.string :construction
      t.text :explanation

      t.timestamps
    end
  end
end
