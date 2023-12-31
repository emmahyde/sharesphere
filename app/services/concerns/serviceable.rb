module Serviceable
  extend ActiveSupport::Concern

  class_methods do
    def call(*args, **kwargs, &)
      return new(*args, **kwargs).send(:call, &) if block_given?

      new(*args, **kwargs).send(:call)
    end
  end
end
