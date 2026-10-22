# Katana Network — External Node Configs

Configuration files and startup scripts for running an external (replica) node on the **Katana** network, for both Mainnet and the **Bokuto** testnet.

Katana is an OP Stack L2 chain built on Conduit. Running an external node requires two services: **op-reth** (execution layer, Conduit fork) and **op-node** (consensus/rollup layer).

Reference setup from Conduit: [conduitxyz/conduit-optimism-external-node](https://github.com/conduitxyz/conduit-optimism-external-node)

---

## Repository Structure

Each network has an **`op-reth/`** folder with the supported setup using op-reth + op-node.

```
.
├── mainnet/
│   └── op-reth/
│       ├── genesis.json                # Mainnet genesis file (op-reth compatible)
│       ├── rollup.json                 # Mainnet rollup config
│       ├── katana-op-reth.sh           # Start mainnet op-reth (execution layer)
│       └── katana-op-node.sh           # Start mainnet op-node (consensus layer)
│
└── bokuto/
    └── op-reth/
        ├── genesis.json                # Bokuto testnet genesis file (op-reth compatible)
        ├── rollup.json                 # Bokuto rollup config
        ├── bokuto-op-reth.sh           # Start Bokuto op-reth (execution layer)
        └── bokuto-op-node.sh           # Start Bokuto op-node (consensus layer)
```

---

## Image Versions

| Component  | Image                                                           | Mainnet   | Bokuto (Testnet) |
|------------|-----------------------------------------------------------------|-----------|------------------|
| op-reth    | `ghcr.io/conduitxyz/conduit-op-reth` (Conduit fork)            | `v2.2.0`  | `v2.2.0`         |
| op-node    | `us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node`      | `v1.19.3` | `v1.19.3`        |

Both networks require **conduit-op-reth** `v2.2.0` before Karst. **op-node** needs `--override.karst=1787760001` on Bokuto (Wed Aug 26 2026 16:00:01 UTC) and `--override.karst=1790179201` on Mainnet (Wed Sep 23 2026 16:00:01 UTC).

---

## Network Details

| Property       | Mainnet                        | Bokuto (Testnet)               |
|----------------|--------------------------------|--------------------------------|
| Chain ID       | `747474`                       | `737373`                       |
| L1             | Ethereum Mainnet               | Ethereum (Holesky/Sepolia)     |
| Sequencer RPC  | `https://rpc.katana.network`   | —                              |

---

## Snapshots

op-reth snapshots (archive node).

| Network | Snapshot URL |
|---------|-------------|
| Mainnet (katana) | https://snapshots.katana-assets.network/katana/latest.tar |
| Bokuto (testnet) | https://snapshots.katana-assets.network/katana-bokuto/latest.tar |

---

## Verify Genesis Files

Before running, verify the genesis file integrity using MD5.

```bash
# Mainnet (op-reth)
md5 -q mainnet/op-reth/genesis.json
# Expected: 2d3d2a13a21defa0efb2e2c112c6c7d0

# Bokuto (op-reth)
md5 -q bokuto/op-reth/genesis.json
# Expected: 64627098ca84b40cd5a3e1d824ac0843
```

On Linux, use `md5sum <file>` instead of `md5 -q <file>`.
