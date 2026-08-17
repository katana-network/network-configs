op_reth_image="ghcr.io/conduitxyz/conduit-op-reth:v2.1.2"

docker run -it --restart unless-stopped -d \
       --network rpcs \
       --name bokuto-opreth \
       --platform linux/amd64 \
       -v $PWD/conf:/network-configs \
       -v $PWD/rethdata:/data \
       -p 8545:8545 \
       -p 8546:8546 \
       -p 30303:30303 \
       -p 30303:30303/udp \
       "$op_reth_image" \
       node \
       --datadir=/data \
       --chain=/network-configs/genesis.json \
       --http \
       --http.addr=0.0.0.0 \
       --http.port=8545 \
       --http.corsdomain=\* \
       --http.api=web3,eth,net,debug \
       --ws \
       --ws.addr=0.0.0.0 \
       --ws.port=8546 \
       --ws.origins=\* \
       --ws.api=web3,eth,net \
       --authrpc.addr=0.0.0.0 \
       --authrpc.port=8551 \
       --authrpc.jwtsecret=/network-configs/jwt.txt \
       --port=30303 \
       --discovery.addr=0.0.0.0 \
       --discovery.port=30303 \
       --trusted-peers=enode://77cd5e9a72392444349880848b8b7acd7207035377dec10da28dfee6228c3dcc15838ecc471fb487fe9b2a6dae641a6ca0fd6809bdaf9aca5dfbfcefe212e13b@136.118.228.4:30303 \
       --rollup.disable-tx-pool-gossip
