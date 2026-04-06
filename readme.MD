# Katana Network — External Node Configs

Configuration files and startup scripts for running an external (replica) node on the **Katana** network, for both Mainnet and the **Bokuto** testnet.

Katana is an OP Stack L2 chain built on Conduit. Running an external node requires two services: **op-geth** (execution layer) and **op-node** (consensus/rollup layer).

---

## Repository Structure

```
.
├── mainnet/
│   ├── genesis.json                    # Mainnet genesis file
│   ├── rollup-snapshot.json            # Mainnet rollup config
│   ├── genesis-init.sh                 # Initialize op-geth datadir from genesis
│   ├── op-geth-snapshot-edition.sh     # Start mainnet op-geth
│   └── op-node-snapshot-edition.sh     # Start mainnet op-node
│
└── bokuto/
    ├── genesis.json                    # Bokuto testnet genesis file
    ├── rollup.json                     # Bokuto rollup config
    ├── genesis-init.sh                 # Initialize op-geth datadir from genesis
    ├── bokuto-op-geth.sh               # Start Bokuto op-geth
    └── bokuto-op-node.sh               # Start Bokuto op-node
```

---

## Network Details

| Property       | Mainnet                        | Bokuto (Testnet)               |
|----------------|--------------------------------|--------------------------------|
| Chain ID       | `747474`                       | `737373`                       |
| L1             | Ethereum Mainnet               | Ethereum (Holesky/Sepolia)     |
| Sequencer RPC  | `https://rpc.katana.network`   | —                              |
| Genesis MD5    | `60621e407c716ae658092c139b825a64` | `4a73c15aebeb062352b1d3e2bc87f3d8` |

---

## Verify Genesis Files

Before initializing, verify the genesis file integrity using MD5:

```bash
# Mainnet
md5sum mainnet/genesis.json
# Expected: 60621e407c716ae658092c139b825a64

# Bokuto
md5sum bokuto/genesis.json
# Expected: 4a73c15aebeb062352b1d3e2bc87f3d8
```

On macOS, use `md5 -q <file>` instead of `md5sum`.
