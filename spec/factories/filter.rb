Factory.define :filter do |f|
  f.query { 'hello world' }

  f.association :user
end
