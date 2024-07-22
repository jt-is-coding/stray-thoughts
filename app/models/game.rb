# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  description :text
#  image       :string
#  platforms   :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  api_id      :integer
#
class Game < ApplicationRecord
  has_many :children, class_name: "Game", foreign_key: "parent_id"
end
