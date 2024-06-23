{ pkgs, config, lib, ... }:

{
  options.stylix.targets.nixos-icons.enable =
    config.lib.stylix.mkEnableTarget "the NixOS logo" true;

  config = lib.mkIf config.stylix.targets.nixos-icons.enable {

    # nixpkgs.overlays = [(self: super: {
    #   nixos-icons = super.nixos-icons.overrideAttrs (oldAttrs: {
    #     src = pkgs.applyPatches {
    #       src = oldAttrs.src;
    #       prePatch = ''
    #         substituteInPlace logo/nix-snowflake-white.svg --replace-fail '#ffffff' '#${config.lib.stylix.colors.base05}'

    #         # Insert attribution comment after the XML prolog
    #         sed \
    #           --in-place \
    #           '2i<!-- The original NixOS logo from ${oldAttrs.src.url} is licensed under https://creativecommons.org/licenses/by/4.0 and has been modified to match the ${config.lib.stylix.colors.scheme} color scheme. -->' \
    #           logo/nix-snowflake-white.svg
    #     '';
    #     };
    #   });
    # })];
  };

}
