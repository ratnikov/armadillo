Factory.sequence :email do |i|
  "email#{i}@example.com"
end

Factory.define :user do |u|
  u.email { Factory.next :email }
  u.password { 'secret' }
  u.confirmation { 'secret' }
end
