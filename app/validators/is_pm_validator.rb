class IsPmValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    user = User.find(value)
    if user.role != 'Project Manager'
      record.errors.add attribute,
                        (options[:message] || 'User not a Project Manager')
    end
  end
end
