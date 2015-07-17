m1=192.168.33.41:10011
m2=192.168.33.42:10012
upstreamname=$1
policypattern=$2


#create upstream at m2 to m1
curl -i -u guest:guest -H "content-type:application/json" \
  -XPUT -d'{"component":"federation-upstream","vhost":"/","name":"'$upstreamname'","value":{"uri":"amqp://'$m1'","ack-mode":"on-confirm","trust-user-id":false}}' \
http://$m2/api/parameters/federation-upstream/%2F/upstream-to-m1-remove

#create policy at m2 to bind all exchanges with $policypattern in name (pattern)
curl -i -u guest:guest -H "content-type:application/json" \
  -XPUT -d'{"vhost":"/","name":"policy-to-bind-all-'$policypattern'","pattern":"'$policypattern'","definition":{"federation-upstream-set":"all"}}' \
http://$m2/api/policies/%2F/policy-to-bind-all-$policypattern