RSpec::Matchers.define :have_error do |errors|
  match do |record|
    !record.valid? && errors.all? do |(attr, expected)| 
      Array(record.errors[attr]).any? { |err| expected === err }
    end
  end

  failure_message_for_should do |record|
    if record.valid?
      "expected record to not be valid"
    else
      "expected record to contain errors matching #{errors.inspect}, but was: #{record.errors.full_messages.inspect}"
    end
  end
end
