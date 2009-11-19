Factory.define :distillery do |d|
  d.sequence(:name) {|n| "Laphoraig#{n}"}
end

Factory.define :expression do |e|
  e.name '10 year old'
  e.distillery {|distillery| distillery.association(:distillery)}
end

Factory.define :user do |u|
  u.name 'Person'
  u.password 'password'
  u.sequence(:email) {|n| "person#{n}@example.com"}
end

Factory.define :score do |s|
  s.value 10
  s.user {|user| user.association(:user)}
  s.expression {|expression| expression.association(:expression)}
end

