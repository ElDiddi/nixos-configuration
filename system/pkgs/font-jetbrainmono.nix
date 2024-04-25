{ lib, fetchFromGitHub }:

let
  pname = "JetBrains-Mono-Nerd-Font-Complete";
  version = "0.1";
in fetchFromGitHub {
  name = "${pname}-${version}";

  owner = "prasanthrangan";
  repo = "hyprdots";
  rev = "5e09ec6bae5e155799eff5281ddde44d8f6a04f6";
  sha256 = "5e09ec6bae5e155799eff5281ddde44d8f6a04f6";

  postFetch = ''
    tar xf $downloadedFile --strip=1
    install -m444 -Dt $out/share/fonts/JetBrains fonts/ttf/*.ttf
  '';

  meta = with lib; {
    description = "Font - JetBrains Mono Nerd Font (Complete)";
    longDescription = "Font - JetBrains Mono Nerd Font (Complete)";
    homepage = "https://github.com/impallari/DancingScript";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ none ];
  };
}