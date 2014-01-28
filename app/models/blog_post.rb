class BlogPost < ActiveRecord::Base
  #attr_accessible :name, :title, :content
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :content, :length => {:maximum => 500}       
  def to_param
    "#{id}-#{name.parameterize}"  
  end         
end
