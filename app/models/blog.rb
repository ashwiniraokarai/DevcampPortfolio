class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}  #status is an attribute (in the table, it's an existing column. 0 is set to indicate draft mode, 1 indicates published)

  #See https://github.com/norman/friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged

  #validations
  validates_presence_of :title, :body   #prevents empty record from being saved (thro create or edit) both via the UI and via the console (Blog.create!())

  #associations
  belongs_to :topic

  #To add the topic_id foreign key to blogs table run:
  #rails g migration add_topic_reference_to_blogs topic:references
  #That creates a migration file which you can migrate via the usual rails db:migrate

end
