class Like < ActiveRecord::Base
  belongs_to :user

  belongs_to :likeable, :polymorphic => true


  def self.find_by_likeable(likeable)
    Like.where(likeable_type: likeable.class.to_s)
        .where(likeable_id: likeable.id)
        .first #to pull out of ActiveRecordCollection
  end
end
