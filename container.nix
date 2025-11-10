{
  dockerTools,
  buildEnv,
  ux,
}:
dockerTools.buildImage {
  name = "ux";
  tag = "latest";

  copyToRoot = buildEnv {
    name = "image-root";
    paths = [ ux ];
    pathsToLink = [ "/bin" ];
  };

  config = {
    Cmd = [ "/bin/ux" ];
  };
}
