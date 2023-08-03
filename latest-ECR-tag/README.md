

above script/cmd is useful for auto increment of ecr image

Ex. =>

suppose a image is in ecr with 

01280929283.dkr.ecr.ap-south-1.amazonaws.com/repository_name/image_name:v0.0.18

above script/cmd will pull tag of above image which is "v0.0.18" in var "$crtag". It will then split "v0.0.18" in three parts with a=v0, b=0, c=18. c will be incremented "c=$(($c+1))".
and then will patch a,b,c vars together which will become "v0.0.19" and will be exported in var "$tag" which can be used for new image.


-------------

how to use

```$ crtag=$(aws ecr describe-images --repository-name repository_name/image_name | jq '.imageDetails | sort_by(.imagePushedAt)[]' | jq --slurp '.[-1]' | jq '.imageTags | last' | jq --raw-output) && a=$(echo $crtag | cut -d '.' -f 1) && echo $crtag && b=$(echo $crtag | cut -d '.' -f 2) && c=$(echo $crtag | cut -d '.' -f 3) && c=$(($c+1)) && export tag="${a}.${b}.${c}" && echo $tag ```

