class User < ApplicationRecord
  def availability=(txt)
    write_attribute(:availability, txt + ' oclock')
    # self[:availability] = txt + ' oclock'  this is shorter form of above one.
    # self conteains object of user so it is equal to user[:availability] = txt + ' oclock'
    # self.availability = txt + 'onwards available.' #this will not work because it will go in infinite loop.
    # availability = txt + 'onwards available.' #this will not work because Rails does not use instance variables like @availability to store the
    # model attributes is in fact an implementation detail. But model instances have a couple of methods, write_attribute and read_attribute ,
    # conveniently provided by Active Record for the purposes of overriding default accessors
  end

  def name
    read_attribute(:name) || 'guest_user'
    # self[:name] || 'guest_user'
    # self.name || 'guest_user' #this will not work because it will go in infinite loop calling this method again and again.
    # name || 'guest_user' #this will not work because it will go in infinite loop calling this method again and again.
  end

end
