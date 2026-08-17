op_reth_image="ghcr.io/conduitxyz/conduit-op-reth:v2.1.2"

docker run -it --restart unless-stopped -d \
       --network rpcs \
       --name katana-opreth \
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
       --trusted-peers=enode://eac04d7f6744ba60b816b290ced16ffd43a258ff9b4cd633dd577242e9ab886bf97f2b707a1a587b8de15e9970ae72567bb9f8973517494b01b7e03a9675df09@35.197.34.76:30303 \
       --rollup.disable-tx-pool-gossip \
       --rollup.sequencer=https://rpc.katana.network
