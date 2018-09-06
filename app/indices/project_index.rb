ThinkingSphinx::Index.define :project, with: :active_record, delta: true do
  indexes title
  has users.id, as: :user_id, type: :integer
end
