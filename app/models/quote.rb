# == Schema Information
#
# Table name: quotes
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  url            :string(255)
#  content        :text
#  user_id        :integer
#  annotation     :string(255)
#  comments_count :integer          default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

class Quote < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable

  acts_as_taggable

  def share_to_fb
    graph   = Koala::Facebook::API.new(user.access_token)
    fb_user = graph.put_wall_post(annotation, {
                                    :name => title,
                                    :link => url,
                                    :description => content
                                  })
  end
end
