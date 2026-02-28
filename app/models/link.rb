# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  label      :string
#  position   :integer
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_links_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Link < ApplicationRecord
  belongs_to :user

  validates :label, presence: true
  validates :url, presence: true
end
