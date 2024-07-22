# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  parent_id  :integer
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

  validates :title, presence: true
  validates :author_id, presence: true
end
