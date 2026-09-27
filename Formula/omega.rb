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
    sha256 "9280b77ad1abf1b4fb93c3d4dca87c5ee68c1a11f169e63558d985fda90281fd"
  end

  on_linux do
    on_intel do
      url "https://github.com/CathedralOS/Omega/releases/download/v0.1.0-alpha.3/omega-0.1.0-alpha.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76fffa0d414eee2691a347f0142d819f553eaf4abc46139a4a9c8df6b18b07e8"
    end
    on_arm do
      url "https://github.com/CathedralOS/Omega/releases/download/v0.1.0-alpha.3/omega-0.1.0-alpha.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee430e3f258acc5c3f08b2bf54f24cbda73952b886b7c95b381f67bb54966a5e"
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
