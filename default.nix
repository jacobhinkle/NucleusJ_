let
     pkgs = import <nixpkgs> {};
     stdenv = pkgs.stdenv;
   in rec {
     javaEnv = stdenv.mkDerivation rec {
       name = "java-env";
       version = "0.0.0.1";
       src = ./.;
       shellHook = ''
             export PS1="javadev > "
                 '';
       buildInputs = (with pkgs; [
            jdk
            wget
            maven
         ]);
     };
   }
