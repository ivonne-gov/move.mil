# This migration comes from refinery_tutorial_steps (originally 2)
class CreateTutorialStepsTutorials < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_tutorial_steps_tutorials do |t|
      t.string :title
      t.string :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tutorial_steps"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tutorial_steps/tutorials"})
    end

    drop_table :refinery_tutorial_steps_tutorials

  end

end
