class Blog < ApplicationRecord
  enum status: {draft: 0, published: 1}  #status is an attribute (in the table, it's an existing column. 0 is set to indicate draft mode, 1 indicates published)

  #See https://github.com/norman/friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged
end
