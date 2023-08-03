

latest_tag_dockerHub.sh this script will fetch and increment a docker tag for a paticular image.


ex: 

Supoose a image with org and name is already present in dockerhub with tag => "docker.io/test-org/test-nginx:v0.0.90"

above script will turn tag from v0.0.90 => v0.0.91.

hence image will become => "docker.io/test-org/test-nginx:v0.0.91"




---
HOW TO USE

to use above script


chmod +x latest_tag_dockerHub.sh

./latest_tag_dockerHub.sh image-name

ex. 

$ ./latest_tag_dockerHub.sh test-nginx

