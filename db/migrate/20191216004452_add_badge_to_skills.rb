#Ash: this file is a result of rails g migration add_badge_to_skills badge:text
#(add a column called "badge" of type text to the skills table)
class AddBadgeToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :badge, :text
    #(add a column called "badge" of type text to the skills table)
  end
end

#run db:migrate to actually get the column added to your table. Should be visible in the schema.
