class Kosh < Formula
  desc "Encrypted secret vault for developers and teams"
  homepage "https://kosh.useyukti.com"
  license "AGPL-3.0-only"

  # Update url and sha256 on each release.
  # Generate sha256: curl -fsSL <url> | shasum -a 256
  url "https://github.com/VaarunSinha/kosh/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "4b805c7e3b1f65d4f11294251d0a25dfe44b8938a1b1d50fa315c6242091f706"

  head "https://github.com/VaarunSinha/kosh.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install",
      "--locked",
      "--path", "crates/kosh-cli",
      "--root", prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kosh --version")
    # Verify init creates a config without error
    system bin/"kosh", "init", "--help"
  end
end
