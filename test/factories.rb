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
  u.name 'Russ'
  u.hashword Digest::SHA1.hexdigest('password' + 'AngelsTake' + '0.30499223691041')
  u.salt '0.30499223691041'
end

