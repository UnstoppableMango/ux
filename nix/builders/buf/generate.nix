{
  buf,
  input,
  config,
  protoc-gen-go,
  runCommand,
}:
runCommand "buf"
  {
    nativeBuildInputs = [
      buf
      protoc-gen-go
    ];
  }
  ''
    buf generate ${input} \
      --config ${config} \
      --output $out
  ''
