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

This starts a shell with offensive security tools available (nmap, metasploit, vagrant, virtualbox).

## Directory Structure

```
.
├── flake.nix                 # Nix flake defining the dev shell
├── flake.lock                # Pinned nixpkgs version
└── test_vms/                 # Test VMs for practicing
    └── metasploitable3-workspace/
        └── Vagrantfile       # Metasploitable3 VM configuration
```
