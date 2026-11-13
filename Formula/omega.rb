class Omega < Formula
  desc "Experimental proof-carrying systems language compiler"
  homepage "https://github.com/CathedralOS/Omega"
  version "0.1.0-alpha.3"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "git"

  on_macos do
    depends_on macos: :sonoma
    depends_on arch: :arm64
    url "https://github.com/CathedralOS/Omega/releases/download/v0.1.0-alpha.3/omega-0.1.0-alpha.3-aarch64-apple-darwin.tar.gz"
    sha256 "07b52a6d1fc1ae53497ed3d7c85e173f3f74173d01371980eeef5486baa2b593"
  end

  on_linux do
    on_intel do
      url "https://github.com/CathedralOS/Omega/releases/download/v0.1.0-alpha.3/omega-0.1.0-alpha.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd983aa90d85df75a3a8e98d78729deb879706005edba4661893c4bb8e261b17"
    end
    on_arm do
      url "https://github.com/CathedralOS/Omega/releases/download/v0.1.0-alpha.3/omega-0.1.0-alpha.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e7d04daec8cbd305143bd9db2459af322c2a56ad296d128f981aae92d398358"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/omega"
  end

  test do
    assert_match "omega 0.1.0-alpha.3 ", shell_output("#{bin}/omega --version")
    (testpath/"main.omg").write("machine smoke(value: u32) -> u32 { value }\n")
    system bin/"omega", "--check", testpath/"main.omg"
  end
end
