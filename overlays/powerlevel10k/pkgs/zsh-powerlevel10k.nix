{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  name = "powerlevel10k";
  src = fetchFromGitHub {
    owner = "romkatv";
    repo = "powerlevel10k";
    rev = "7b77d63e7e29fd81f691c9e43e3a3cadf72880a6";
    sha256 = "0gc7812snck6rd8m9xb2cczryxnwgsvb6cpc43qd2lma42n7n5hf";
  };

  installPhase = ''
    mkdir -p $out/powerlevel10k
    mv * $out/powerlevel10k
  '';
}