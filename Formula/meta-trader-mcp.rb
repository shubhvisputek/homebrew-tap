class MetaTraderMcp < Formula
  desc "Cross-platform Model Context Protocol server for MetaTrader 5"
  homepage "https://github.com/shubhvisputek/meta-trader-mcp"
  url "https://files.pythonhosted.org/packages/03/e5/bb0622222407cb597fb77a5f5c6c3fdba6b720549bf2dfc09790abf26b2a/meta_trader_mcp-1.0.1.tar.gz"
  sha256 "db89d09de85a2eef8db7357af5067e05ce5dc1c4c73d2885a01795225c3df0a0"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Build an isolated venv and install the staged sdist plus its
    # dependencies. pip pulls prebuilt wheels (numpy/pandas/pydantic-core),
    # so nothing is compiled from source here.
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/meta-trader-mcp"
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/meta-trader-mcp --version")
    # The server must import and list its tools without a live MT5 terminal.
    assert_match "serve",
      shell_output("#{bin}/meta-trader-mcp --help")
  end
end
