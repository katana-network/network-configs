op_node_image="us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:v1.19.3"

docker run -it --restart unless-stopped -d \
       --network rpcs \
       --name katana-opnode \
       -v $PWD/conf:/network-configs \
       -v $PWD/nodedata:/data \
       -p 8547:8547 \
       "$op_node_image" \
       op-node \
       --log.level=INFO \
       --l2=http://katana-opreth:8551 \
       --l2.jwt-secret=/network-configs/jwt.txt \
       --l2.enginekind=reth \
       --rollup.config=/network-configs/rollup.json \
       --rpc.addr=0.0.0.0 \
       --rpc.port=8547 \
       --rpc.enable-admin \
       --l1=REPLACE_WITH_YOUR_L1_RPC \
       --l1.rpckind=standard \
       --l1.beacon=REPLACE_WITH_YOUR_L1_BEACON \
       --safedb.path=/data/op-node/op-node-beacon-data \
       --altda.enabled=False \
       --l1.trustrpc \
       --verifier.l1-confs=15 \
       --l1.max-concurrency=20 \
       --l1.rpc-max-batch-size=50 \
       --override.isthmus=1746806401 \
       --override.jovian=1773066601 \
       --override.karst=1790179201 \
       --syncmode=execution-layer \
       --p2p.static=/ip4/35.197.34.76/tcp/9222/p2p/16Uiu2HAmHH6mUXKW7erYvbUvjPMN5HfH8nktTfZBnUr8bk6aH75V \
       --p2p.no-discovery
