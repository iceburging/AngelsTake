Factory.define :distillery do |d|
  d.name 'Laphoraig'
end

Factory.define :expression do |e|
  e.name '10 year old'
end

Factory.define :score do |s|
  s.value '10'
end

Factory.define :user do |u|
  u.name 'Person'
  u.password 'password'
  u.sequence(:email) {|n| "person#{n}@example.com"}
end

