# This migration comes from refinery_tutorials (originally 1)
class CreateTutorialsTutorials < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_tutorials do |t|
      t.string :title
      t.string :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tutorials"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tutorials/tutorials"})
    end

    drop_table :refinery_tutorials

  end

end
