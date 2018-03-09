# This migration comes from refinery_tutorial_steps (originally 1)
class CreateTutorialStepsTutorialSteps < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_tutorial_steps do |t|
      t.text :content
      t.integer :image_id
      t.text :pro_tip
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-tutorial_steps"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/tutorial_steps/tutorial_steps"})
    end

    drop_table :refinery_tutorial_steps

  end

end
