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

### One-time setup

1. Install vagrant plugins:
```bash
vagrant plugin install vagrant-libvirt
vagrant plugin install vagrant-mutate
```

2. Download and convert the boxes:
```bash
# Ubuntu 14.04 target
vagrant box add rapid7/metasploitable3-ub1404 --provider virtualbox
vagrant mutate rapid7/metasploitable3-ub1404 libvirt

# Windows 2008 target (optional, large download)
vagrant box add rapid7/metasploitable3-win2k8 --provider virtualbox
vagrant mutate rapid7/metasploitable3-win2k8 libvirt
```

3. Start the VMs:
```bash
cd test_vms/metasploitable3-workspace
vagrant up
```

## Directory Structure

```
.
├── flake.nix                 # Nix flake defining the dev shell
├── flake.lock                # Pinned nixpkgs version
└── test_vms/                 # Test VMs for practicing
    └── metasploitable3-workspace/
        └── Vagrantfile       # Metasploitable3 VM configuration
```
