let flip = f: x: y: f y x; in
let overridePackageAttrs = overrides: pkgs:
  flip pkgs.lib.mapAttrs overrides (packageName: spec:
    let inputOverrides = (spec.inputs or (pkgs: {})) pkgs; in
    let attrOverrides = (spec.attrs or (pkgs: {})) pkgs; in
    let attrUpdater =
      if builtins.isAttrs attrOverrides
      then flip pkgs.lib.recursiveUpdate attrOverrides
      else attrOverrides;
    in
    (pkgs.${packageName}.override inputOverrides).overrideAttrs attrUpdater);
in
let
  tab = "\t"; 
  noInterpolationPatch = ''
    diff --git a/src/macterm.c b/src/macterm.c
    index 2cdcd6eb11..627c15bed4 100644
    --- a/src/macterm.c
    +++ b/src/macterm.c
    @@ -1927,2 +1927,3 @@ mac_draw_image_foreground (struct glyph_string *s)
     ${tab}flags |= MAC_DRAW_CG_IMAGE_2X;
    +      flags |= MAC_DRAW_CG_IMAGE_NO_INTERPOLATION;
           mac_draw_cg_image (s->f, s->gc, s->img->cg_image, s->img->cg_transform,
  '';
in
{
  allowUnfree = true;
  packageOverrides = overridePackageAttrs {
    jpm = attrs: {
      # this is so hacky, but it's otherwise
      # only available as a function input.
      janet = builtins.head attrs.buildInputs;
      installPhase = attrs.installPhase + ''
      mkdir $out/include
      rmdir $out/lib/janet
      ln -s $janet/include/janet $out/include/janet
      ln -s $janet/lib/janet $out/lib/janet
      '';
    };
    emacsMacport = attrs: {
      prePatch = attrs.postPatch;
      postPatch = "";
      patches = [ (builtins.toFile "no-interpolation.patch" noInterpolationPatch) ];
    };
  };
}
