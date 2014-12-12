json.owner do
  json.partial! 'api/ideas/user', user: comment.user
end
json.id comment.id
json.comment comment.comment
json.created_at comment.created_at
