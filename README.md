# Offensive Security Toolkit

## Getting Started

With direnv installed:
```bash
direnv allow
```

Or manually:
```bash
nix develop -c $SHELL
```

This starts a shell with offensive security tools available (nmap, metasploit, vagrant, libvirt, qemu).

## Test VMs Setup

The test VMs use libvirt/QEMU. The metasploitable3 boxes are only distributed for VirtualBox, so they need to be converted.

```bash
cd test_vms/metasploitable3-workspace
./run-vms
```

This script installs plugins, downloads/converts boxes, and starts the VMs.

## Directory Structure

```
.
├── flake.nix                 # Nix flake defining the dev shell
├── flake.lock                # Pinned nixpkgs version
└── test_vms/                 # Test VMs for practicing
    └── metasploitable3-workspace/
        ├── Vagrantfile       # Metasploitable3 VM configuration
        └── run-vms           # Setup and start script
```
