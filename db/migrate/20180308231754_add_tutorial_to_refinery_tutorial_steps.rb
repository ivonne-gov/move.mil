class AddTutorialToRefineryTutorialSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_tutorial_steps, :tutorial_id, :integer
  end
end
