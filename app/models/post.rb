class Post < ActiveRecord::Base
  validates  :title, :content, presence: true

  has_many   :votes, as: :voteable

  belongs_to :category
  belongs_to :user

  #Polymorphic Association
  belongs_to :parent, class_name: 'Post', foreign_key: :parent_id
  has_many :children, class_name: 'Post', foreign_key: :parent_id

  # search
  def self.search(query)
    where("content like ? OR title like ?", "%#{query}%", "%#{query}%")
  end

  after_create :time_elapsed
    
  def time_elapsed
    now = Time.now
    t = now - self.created_at
    if (t < 60)
        return "#{t.floor} seconds ago"
  elsif (t < 60*60)
      return "#{(t/60).floor} minutes ago"
    elsif(t < 60*60*60)
      return "#{(t/3600).floor} hours ago"  
    else  
      return "#{(t/86400).floor} days ago"  
    end
  end
#   def self.search(search)
#   if search
#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     # find(:all)
#     puts "error"
#   end
# end

end
