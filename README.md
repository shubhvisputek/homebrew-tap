# shubhvisputek/homebrew-tap

Homebrew formulae for [@shubhvisputek](https://github.com/shubhvisputek)'s tools.

## meta-trader-mcp

A cross-platform [Model Context Protocol](https://modelcontextprotocol.io) server for MetaTrader 5.

```bash
brew install shubhvisputek/tap/meta-trader-mcp
```

Then run it:

```bash
meta-trader-mcp --help
meta-trader-mcp serve --transport stdio        # client-managed (default)
```

The formula installs the CLI into an isolated virtualenv under the Homebrew
cellar (dependencies come from prebuilt PyPI wheels, so nothing is compiled).
It requires network access during `brew install`.

> ⚠️ Trading is **off by default**. See the
> [main project](https://github.com/shubhvisputek/meta-trader-mcp) and its
> [DISCLAIMER](https://github.com/shubhvisputek/meta-trader-mcp/blob/main/DISCLAIMER.md)
> before enabling live orders.

### Upgrading

```bash
brew update && brew upgrade meta-trader-mcp
```

### Uninstalling

```bash
brew uninstall meta-trader-mcp
brew untap shubhvisputek/tap
```
