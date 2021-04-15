class ProjectHasOneTaskValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.tasks.size < 1
      record.errors.add attribute,
                        (
                          options[:message] ||
                            'Project must have at least one task'
                        )
    end
  end
end
