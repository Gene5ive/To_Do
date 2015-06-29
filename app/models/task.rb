class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true
  scope(:done, -> do
    where({done: true})
  end)
end
