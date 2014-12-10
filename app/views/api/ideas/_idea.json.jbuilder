json.id idea.id
json.name idea.name
json.description idea.description
json.owner do
  json.partial! 'user', user: idea.user if idea.user
end
json.buyer do
  json.partial! 'user', user: idea.buyer if idea.buyer
end
json.keyword idea.keyword
json.published idea.published
json.votes idea.votes.count
