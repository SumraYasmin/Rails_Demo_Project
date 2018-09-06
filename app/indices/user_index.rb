ThinkingSphinx::Index.define :user, with: :active_record, delta: true do
  indexes [first_name, last_name], as: :user_name
  has role
end
