class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
# This class allows you to store the user object for the duration of a request.
