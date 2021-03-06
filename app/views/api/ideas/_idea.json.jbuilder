json.id idea.id
json.name idea.name
json.description idea.description
json.owner do
  json.partial! 'user', user: idea.user if idea.user
end
json.buyer do
  json.partial! 'user', user: idea.buyer if idea.buyer
end
json.comments idea.comments, partial: 'api/comments/comment', as: :comment
json.keywords idea.keywords
json.published idea.published
json.votes idea.votes.count
json.voted idea.voted?(current_user)
