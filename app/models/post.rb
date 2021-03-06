class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}
  validates_presence_of :name, :content

  private

  def destroy_comments
    self.comments.delete_all
  end
end
