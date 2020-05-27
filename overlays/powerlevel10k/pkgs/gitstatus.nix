# { stdenv, fetchFromGitHub, makeWrapper, libgit2-romkatv }:

# stdenv.mkDerivation {
#   name = "gitstatus";
#   version = "unstable-2019-12-18";

#   src = fetchFromGitHub {
#     owner = "romkatv";
#     repo = "gitstatus";
#     #rev = "e26af91f888dbad723c057b7c20b24dd088171d6";
#     # rev = "1cdb4dfd4cec6fcbd86fcb9899c7199b26748ea5";
#     # #sha256 = "0654w7c2102xn2n9krn0y9r4y4jq5sgdipjldbd6sswr7msq8dxv";
#     # sha256 = "1jpd1lwafwgj0hblqn5511x7s7hz0xjxp9423l1q7bvhsjkinvcz";
#     rev = "8ae9c17a60158dcf91f56d9167493e3988a5e921";
#     sha256 = "1czjwsgbmxd1d656srs3n6wj6bmqr8p3aw5gw61q4wdxw3mni2a6";
#   };

#   buildInputs = [ libgit2-romkatv ];

#   installPhase = ''
#     mkdir -p $out/bin
#     cp gitstatusd $out/bin/
#   '';
# }

{callPackage, stdenv, fetchFromGitHub, ...}:

stdenv.mkDerivation {
  pname = "gitstatus";
  version = "unstable-2019-12-18";

  src = fetchFromGitHub {
    owner = "romkatv";
    repo = "gitstatus";
    rev = "8ae9c17a60158dcf91f56d9167493e3988a5e921";
    sha256 = "1czjwsgbmxd1d656srs3n6wj6bmqr8p3aw5gw61q4wdxw3mni2a6";
  };

  buildInputs = [ (callPackage ./romkatv_libgit2.nix {}) ];
  patchPhase = ''
    sed -i "s|local daemon=.*|local daemon=$out/bin/gitstatusd|" gitstatus.plugin.zsh
  '';
  installPhase = ''
    install -Dm755 gitstatusd $out/bin/gitstatusd
    install -Dm444 gitstatus.plugin.zsh $out
  '';

  meta = with stdenv.lib; {
    description = "10x faster implementation of `git status` command";
    homepage = https://github.com/romkatv/gitstatus;
    license = [ licenses.gpl3 ];

    maintainers = [ maintainers.mmlb ];
  };
}