#this file is a result of rails g migration add_topic_reference_to_blogs topic:references
#"add a topic_id reference (foreign key) reference to the blogs table so it can talk to the topics table"
class AddTopicReferenceToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :blogs, :topic, foreign_key: true
    #Ash: blogs is the table to which you want to add the topic_id column that stores is the foreign keys
  end
end
