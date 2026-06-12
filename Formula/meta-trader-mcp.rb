class MetaTraderMcp < Formula
  desc "Cross-platform Model Context Protocol server for MetaTrader 5"
  homepage "https://github.com/shubhvisputek/meta-trader-mcp"
  url "https://files.pythonhosted.org/packages/81/0b/a07a7eabf3904dd2327d698339d48d3ee9b5d3a2e1145bff766b14dd5c92/meta_trader_mcp-1.0.0.tar.gz"
  sha256 "8918ca93246f47c7a20e3cb96a854351b2735342aed62ce2c1431d45f19660a8"
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
    assert_match "1.0.0", shell_output("#{bin}/meta-trader-mcp --version")
    # The server must import and list its tools without a live MT5 terminal.
    assert_match "serve",
      shell_output("#{bin}/meta-trader-mcp --help")
  end
end
