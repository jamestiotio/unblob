# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  e2fsprogs = {
    pname = "e2fsprogs";
    version = "v1.47.0-3.ok1";
    src = fetchFromGitHub {
      owner = "onekey-sec";
      repo = "e2fsprogs";
      rev = "v1.47.0-3.ok1";
      fetchSubmodules = false;
      sha256 = "sha256-lGv1l9/guOEskvIE6DIsg/nRiDTvORZI0h7n623/fgU=";
    };
  };
  jefferson = {
    pname = "jefferson";
    version = "0.4.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/j/jefferson/jefferson-0.4.5.tar.gz";
      sha256 = "sha256-+cPOzzO3bCQAu8LrbjUJ5S/SR5OFitOYLIu5L9t/q+k=";
    };
  };
  lief = {
    pname = "lief";
    version = "0.13.2";
    src = fetchFromGitHub {
      owner = "lief-project";
      repo = "LIEF";
      rev = "0.13.2";
      fetchSubmodules = false;
      sha256 = "sha256-lH4SqwPB2Jp/wUI2Cll67PQbHbwMqpNuLy/ei8roiHg=";
    };
  };
  lzallright = {
    pname = "lzallright";
    version = "v0.2.3";
    src = fetchFromGitHub {
      owner = "vlaci";
      repo = "lzallright";
      rev = "v0.2.3";
      fetchSubmodules = false;
      sha256 = "sha256-Zzif6WtecgAkNmml0kt0Z+Ewx0L30ahr+kwzYR5aUAM=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./lzallright-v0.2.3/Cargo.lock;
      outputHashes = {
        
      };
    };
  };
  pyfatfs = {
    pname = "pyfatfs";
    version = "1.0.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/p/pyfatfs/pyfatfs-1.0.5.tar.gz";
      sha256 = "sha256-5J6gYhGf32GYx7u8/ghYnYkZ40rCH19gTQ7YtcREly0=";
    };
  };
  treelib = {
    pname = "treelib";
    version = "1.7.0";
    src = fetchurl {
      url = "https://pypi.org/packages/source/t/treelib/treelib-1.7.0.tar.gz";
      sha256 = "sha256-m/8a9Ba55kKmzQ4EMdFe3yaiS40MiuaK+9OAG14w+2E=";
    };
  };
  ubi_reader = {
    pname = "ubi_reader";
    version = "0.8.9";
    src = fetchurl {
      url = "https://pypi.org/packages/source/u/ubi_reader/ubi_reader-0.8.9.tar.gz";
      sha256 = "sha256-b6Jp8xB6jie35F/oLEea1RF+F8J64AiiQE3/ufwu1mE=";
    };
  };
}
