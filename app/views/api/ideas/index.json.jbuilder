json.array! @ideas do |idea|
  json.id idea.id
  json.name idea.name
  json.description idea.description
  json.email idea.email
  json.owner idea.owner
  json.keyword idea.keyword
end
