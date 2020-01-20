set -e

if [[ $* == *--help* ]]
then
	echo "Usage:"
	echo -e "\t./run.sh"
	echo ""
	echo -e "\t--rm\t\tRemove dockers prior to running them, to clear data"
	echo -e "\t--no-build\t\tRun without building docker images"
	echo -e "\t--no-run\t\tBuild docker images without running"
	echo -e "\t--cleanup\t\tAlias for --rm --no-run --no-build. Overrides all other flags"
	exit
fi

if [[ $* == *--cleanup* ]]
then
  set -- "--rm --no-run --no-build"
fi

if [[ $* != *--no-build* ]]
then
 	docker build -t "kaspad" "./kaspad" -f "./kaspad/docker/Dockerfile"
	docker build -t "kasparovd" "./kasparov" -f "./kasparov/kasparovd/docker/Dockerfile"
	docker build -t "kasparovsyncd" "./kasparov" -f "./kasparov/kasparovsyncd/docker/Dockerfile"
fi

if [[ $* == *--rm* ]]
then
	docker-compose down
  docker-compose rm -f -s -v
  rm -rf data/
fi

if [[ $* != *--no-run* ]]
then

  mkdir -p data
	cp -af ./rpc/. ./data
	docker-compose up -d kaspad mysql rabbitmq 
	sleep 8s
	docker-compose up -d kasparov_migrate
	sleep 8s
	docker-compose up -d kasparovd kasparovsyncd
fi