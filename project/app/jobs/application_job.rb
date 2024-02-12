class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
  p = Product.create(id: 1, name: "test 01")

  p = Product.new
  p.id = 2
  p.name = "test 02"
  puts p.name # "test 02"
  p.save

  products = Product.all
  product = Product.first
  product02 = User.find_by(name: 'test 02')
end
