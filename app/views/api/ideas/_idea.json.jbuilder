json.id idea.id
json.name idea.name
json.description idea.description
json.owner do
  json.partial! 'user', user: idea.user if idea.user
end
json.keyword idea.keyword
json.published idea.published
