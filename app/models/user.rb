
  #ASH: model generated as a result of rails generate devise User (devise is an authentication gem)
class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Others available are :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

#ASH - enforce name as a mandatory data users need to submit. This was an afterthought. Needed in order to grab the first and last name virtual attributes
#defined below so we don't run into an error when users do not supply
validates_presence_of :name

#ASH - adding virtual attributes (unlike regular attributes that live as column names on tables, virtual attributes DON'T)
def first_name
  self.name.split.first #same as split[0]
  #You could have skipped the self keyword and it'd have worked the same BUT if somewhere else on the code your or some one used self.
  #to denote the instance variable, then this variable without self. (just "name") would be treated as a local variable unrelated to self.name
  #which obviously is not what you want
end

def last_name
  self.name.split.last
end

end
