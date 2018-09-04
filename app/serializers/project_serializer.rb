class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :description

  has_many :time_logs
end
