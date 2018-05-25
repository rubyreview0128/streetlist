class Event < ActiveRecord::Base
  validates_presence_of :name, :message => "事件名稱不能是空的=="
  validates_presence_of :price, :message => "價格要公開透明<3"
  validates_presence_of :category_id, :message => "要選一個分類辣"
  validates_numericality_of :price, :message => "阿拉伯數字傻屌"
  validates_numericality_of :price, :only_integer => true, :message => "填五毛去吃屎，懂?"
  validates_uniqueness_of :name, :message => "已經有一樣的事件囉"
  belongs_to :category
end
