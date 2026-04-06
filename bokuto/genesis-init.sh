op_geth_image="ghcr.io/conduitxyz/conduit-op-geth:conduit-v1.101609.0"

docker run -it \
       -v $PWD/conf:/network-configs \
       -v $PWD/gethdata:/data \
       "$op_geth_image" \
       init \
       --datadir=/data/geth/execution-data \
       --state.scheme=hash /network-configs/genesis.json
