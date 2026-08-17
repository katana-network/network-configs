op_node_image="us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:v1.19.3"

docker run -it --restart unless-stopped -d \
       --network rpcs \
       --name bokuto-opnode \
       -v $PWD/conf:/network-configs \
       -v $PWD/nodedata:/data \
       -p 8547:8547 \
       "$op_node_image" \
       op-node \
       --log.level=INFO \
       --l2=http://bokuto-opreth:8551 \
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
       --override.isthmus=1749807000 \
       --override.jovian=1770136201 \
       --syncmode=execution-layer \
       --p2p.static=/ip4/136.118.228.4/tcp/9222/p2p/16Uiu2HAmJzgCLweBUU2nKnDyQdihDMPErTyanz9KGtMzkbQLhjRv \
       --p2p.no-discovery
