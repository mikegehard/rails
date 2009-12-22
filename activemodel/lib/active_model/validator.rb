module ActiveModel #:nodoc:

  # A simple base class that can be used along with ActiveModel::Base.validates_with
  #
  #   class Person < ActiveModel::Base
  #     validates_with MyValidator
  #   end
  #
  #   class MyValidator < ActiveModel::Validator
  #     def validate
  #       if some_complex_logic
  #         record.errors[:base] = "This record is invalid"
  #       end
  #     end
  #
  #     private
  #       def some_complex_logic
  #         # ...
  #       end
  #   end
  #
  # Any class that inherits from ActiveModel::Validator will have access to <tt>record</tt>,
  # which is an instance of the record being validated, and must implement a method called <tt>validate</tt>.
  #
  #   class Person < ActiveModel::Base
  #     validates_with MyValidator
  #   end
  #
  #   class MyValidator < ActiveModel::Validator
  #     def validate
  #       record # => The person instance being validated
  #       options # => Any non-standard options passed to validates_with
  #     end
  #   end
  #
  # To cause a validation error, you must add to the <tt>record<tt>'s errors directly
  # from within the validators message
  #
  #   class MyValidator < ActiveModel::Validator
  #     def validate
  #       record.errors[:base] << "This is some custom error message"
  #       record.errors[:first_name] << "This is some complex validation"
  #       # etc...
  #     end
  #   end
  #
  # To add behavior to the initialize method, use the following signature:
  #
  #   class MyValidator < ActiveModel::Validator
  #     def initialize(record, options)
  #       super
  #       @my_custom_field = options[:field_name] || :first_name
  #     end
  #   end
  #
  class Validator
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def validate(record)
      raise "You must override this method"
    end
  end
end
