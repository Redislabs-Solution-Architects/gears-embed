docker compose --profile redis up -d

echo "*** Wait for RE to come up ***"
curl -s -o /dev/null --retry 5 --retry-all-errors --retry-delay 3 -f -k -u "redis@redis.com:redis" https://192.168.20.2:9443/v1/bootstrap

echo "*** Build Cluster ***"
docker exec -it re1 /opt/redislabs/bin/rladmin cluster create name cluster.local username redis@redis.com password redis
docker exec -it re2 /opt/redislabs/bin/rladmin cluster join nodes 192.168.20.2 username redis@redis.com password redis
docker exec -it re3 /opt/redislabs/bin/rladmin cluster join nodes 192.168.20.2 username redis@redis.com password redis

echo "*** Build RE DB ***"
curl -s -o /dev/null -k -u "redis@redis.com:redis" https://192.168.20.2:9443/v1/bdbs -H "Content-Type:application/json" -d @redb.json

echo "*** Deploy Gears Functions ***"
npm run deploy_rollup