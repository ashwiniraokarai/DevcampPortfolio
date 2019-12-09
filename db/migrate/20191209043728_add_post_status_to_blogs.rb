#This migration file is a result of: rails g migration add_post_status_to_blogs status:integer
#which was to add an integer column called "status" to the existing blogs table
class AddPostStatusToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :status, :integer, default:0 #Ash: default was added manually after creating the migration
  end
end
