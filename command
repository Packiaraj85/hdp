docker pull hortonworks/sandbox-hdp:3.0.1
docker pull hortonworks/sandbox-proxy:1.0


docker network create sandbox-network

docker run --network=sandbox-network -p 30022:22 -p 30080:8080 -p 30042:4200 --name sandbox-hdp -h sandbox-hdp -d hortonworks/sandbox-hdp:3.0.1

docker run --network=sandbox-network --name sandbox-proxy --privileged -d -v /var/run/docker.sock:/var/run/docker.sock hortonworks/sandbox-proxy:1.0

docker run --network=sandbox-network --name sandbox-proxy --privileged -d hortonworks/sandbox-proxy:1.0

docker exec sandbox-proxy /usr/bin/start-sandbox-hdp


docker pull hortonworks/sandbox-hdp:latest
docker pull hortonworks/sandbox-proxy:latest
docker network create sandbox-network
docker run --network=sandbox-network --name sandbox-hdp -h sandbox-hdp -d hortonworks/sandbox-hdp:latest
docker run --network=sandbox-network --name sandbox-proxy --privileged -d -v /var/run/docker.sock:/var/run/docker.sock hortonworks/sandbox-proxy:latest
docker exec sandbox-proxy /usr/bin/start-sandbox-hdp
