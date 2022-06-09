docker network create radio-eastern

docker run --name observer -dp 8080:80 `
  -v /path/to/conf.template:/etc/nginx/templates/conf.template `
  --network radio-eastern --network-alias observer observer
# docker run --name obplayer -dp 8080:23233 -p 8081:23456 `
#   --network radio-eastern --network-alias obplayer obplayer 
