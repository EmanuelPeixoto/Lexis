{
  autoCmd = [
    {
      event = "BufWritePre";
      pattern = [ "*.nix" "*.rs" "*.go" "*.lua" "*.py" "*.ts" "*.js" "*.html" "*.css" "*.tex" "*.toml" "*.yaml" "*.yml" ];
      command = ":%s/\\s\\+$//e";
    }
  ];
}
