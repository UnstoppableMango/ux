{
  config,
  writeShellApplication,
  ux,
}:
writeShellApplication {
  name = "ux-codegen";

  runtimeInputs = [ ux ];

  text = ''
    ux <<<'${builtins.toJSON config}'
  '';
}
