op_geth_image="ghcr.io/conduitxyz/conduit-op-geth:conduit-v1.101609.0"

docker run -it --restart unless-stopped -d \
       --network rpcs \
       --name bokuto-opgeth \
       -v $PWD/conf:/network-configs \
       -v $PWD/gethdata:/data \
       -p 8545:8545 \
       "$op_geth_image" \
       --networkid=737373 \
       --datadir=/data/geth/execution-data \
       --gcmode=archive \
       --state.scheme=hash \
       --http \
       --http.port=8545 \
       --http.addr=0.0.0.0 \
       --http.vhosts=\* \
       --http.corsdomain=\* \
       --http.api=admin,engine,net,eth,web3,debug,miner \
       --ws \
       --ws.addr=0.0.0.0 \
       --ws.port=8546 \
       --ws.api=admin,engine,net,eth,web3,debug,miner \
       --ws.origins=\* \
       --authrpc.port=8551 \
       --authrpc.addr=0.0.0.0 \
       --authrpc.vhosts=\* \
       --authrpc.jwtsecret=/network-configs/jwt.txt \
       --syncmode=full \
       --rpc.allow-unprotected-txs \
       --ipcpath=/tmp/geth.ipc \
       --override.isthmus=1749807000 \
       --override.jovian=1770136201
