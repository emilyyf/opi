{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    elixir
    postgresql
		git
    geos
    gdal
  ];

  # ENV Variables
  LD_LIBRARY_PATH = "${pkgs.geos}/lib:${pkgs.gdal}/lib";
  PGDATA = "${toString ./.}/.pg";

  # Post Shell Hook
  shellHook = ''
    echo "Using ${pkgs.postgresql.name}."

    # Setup: other env variables
    export PGHOST="$PGDATA"
    # Setup: DB
    [ ! -d $PGDATA ] && pg_ctl initdb -o "-U postgres" && cat postgresql.conf >> $PGDATA/postgresql.conf
    pg_ctl -o "-p 5555 -k $PGDATA" start
    alias fin="pg_ctl stop && exit"
    alias pg="psql -p 5555 -U postgres"
  '';
}
