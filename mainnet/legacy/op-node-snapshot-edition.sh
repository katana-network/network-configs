op_node_image="us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:v1.16.9"

docker run -it --restart unless-stopped -d \
       --network rpcs \
       --name katana-opnode \
       -v $PWD/conf:/network-configs \
       -v $PWD/nodedata:/data \
       -p 8547:8547 \
       "$op_node_image" \
       op-node \
       --log.level=INFO \
       --l2=http://katana-opgeth:8551 \
       --l2.jwt-secret=/network-configs/jwt.txt \
       --rollup.config=/network-configs/rollup.json \
       --rpc.addr=0.0.0.0 \
       --rpc.port=8547 \
       --rpc.enable-admin \
       --l1=https://mainnet.gateway.tenderly.co/REPLACE_WITH_YOUR_API_KEY \
       --l1.rpckind=standard \
       --l1.beacon=https://mainnet.gateway.tenderly.co/REPLACE_WITH_YOUR_API_KEY \
       --safedb.path=/data/op-node/op-node-beacon-data \
       --altda.enabled=False \
       --l1.trustrpc \
       --verifier.l1-confs=15 \
       --l1.max-concurrency=20 \
       --l1.rpc-max-batch-size=50 \
       --override.isthmus=1746806401 \
       --override.jovian=1773066601 \
       --p2p.static=/ip4/34.19.21.27/tcp/9222/p2p/16Uiu2HAm3xezniqrtMrMqXKPp46Rb2d4mJ67f9TYayHC51SvCrqN \
       --p2p.bootnodes=enode://7ecd63a274fff82da91b6e192cff66cee8d703e33a818c36257d8c9bd050cc81f334157cb03d4145a345d284afd66c91936cf8b8691e6947e3b0ad5d2ed82aca@34.19.21.27:9222?discport=30301,enode://d25ce99435982b04d60c4b41ba256b84b888626db7bee45a9419382300fbe907359ae5ef250346785bff8d3b9d07cd3e017a27e2ee3cfda3bcbb0ba762ac9674@bootnode.conduit.xyz:0?discport=30301,enode://2d4e7e9d48f4dd4efe9342706dd1b0024681bd4c3300d021f86fc75eab7865d4e0cbec6fbc883f011cfd6a57423e7e2f6e104baad2b744c3cafaec6bc7dc92c1@34.65.43.171:0?discport=30305,enode://9d7a3efefe442351217e73b3a593bcb8efffb55b4807699972145324eab5e6b382152f8d24f6301baebbfb5ecd4127bd3faab2842c04cd432bdf50ba092f6645@34.65.109.126:0?discport=30305

