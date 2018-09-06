ThinkingSphinx::Index.define :client, with: :active_record, delta: true do
  indexes [first_name, last_name], as: :client_name
  indexes email
end
