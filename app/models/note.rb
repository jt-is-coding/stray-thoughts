# == Schema Information
#
# Table name: notes
#
#  id                 :integer          not null, primary key
#  searchable_content :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  author_id          :integer          not null
#  parent_id          :integer
#
# Indexes
#
#  index_notes_on_author_id  (author_id)
#  index_notes_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#  parent_id  (parent_id => games.id)
#
class Note < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :parent, class_name: "Game"
  has_rich_text :content

  validates :author_id, presence: true
  before_save :update_searchable_content

  private
  
  def update_searchable_content
    self.searchable_content = content.to_plain_text
  end

  def self.ransackable_attributes(auth_object = nil)
    ["searchable_content"]
  end
end
