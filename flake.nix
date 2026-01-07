{
  description = "Offensive security toolkit";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in {
          default = pkgs.mkShell {
            packages = [
              pkgs.nmap
              pkgs.metasploit
              pkgs.vagrant
              pkgs.libvirt
              pkgs.qemu
              pkgs.postgresql
            ];
            VAGRANT_DEFAULT_PROVIDER = "libvirt";
            shellHook = ''
              PGDATA="$HOME/.local/share/msf-postgres"
              if [ ! -f "$PGDATA/postmaster.pid" ]; then
                if [ ! -d "$PGDATA" ]; then
                  initdb -D "$PGDATA" --auth=trust > /dev/null
                  echo "unix_socket_directories = '$PGDATA'" >> "$PGDATA/postgresql.conf"
                  echo "listen_addresses = '127.0.0.1'" >> "$PGDATA/postgresql.conf"
                  echo "port = 5433" >> "$PGDATA/postgresql.conf"
                fi
                pg_ctl -D "$PGDATA" -l "$PGDATA/logfile" start > /dev/null
                sleep 1
                createdb -h 127.0.0.1 -p 5433 msf 2>/dev/null || true
              fi
            '';
          };
        });
    };
}
