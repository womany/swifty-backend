# == Schema Information
#
# Table name: quotes
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  url            :string(255)
#  content        :text
#  user_id        :integer
#  comment        :string(255)
#  comments_count :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

class Quote < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable
end
