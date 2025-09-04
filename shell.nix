{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Build tools
    pandoc
    texlive.combined.scheme-full  # Full LaTeX distribution for PDF generation
    
    # `make` is included in stdenv
  ];
}
