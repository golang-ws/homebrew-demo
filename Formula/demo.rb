# This file was generated by GoReleaser. DO NOT EDIT.
class Demo < Formula
  desc "Jenkins CLI allows you manage your Jenkins as an easy way"
  homepage "https://github.com/jenkins-zh/jenkins-cli"
  version "0.0.10"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/LinuxSuRen/go-demo/releases/download/v0.0.10/go-demo_0.0.10_Darwin_x86_64.tar.gz"
    sha256 "676e6a2534cdb0748c22f48bd0532ac92167e7d7fc7a16102979dba1ee5214e7"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/LinuxSuRen/go-demo/releases/download/v0.0.10/go-demo_0.0.10_Linux_x86_64.tar.gz"
      sha256 "1a9930499d8af8d16c5429bf3fac702b361a1dfce734be4fd4d441a89bd43d52"
    end
  end

  def install
    bin.install name
    
    # Install bash completion
    output = Utils.popen_read("#{bin}/jcli completion")
    (bash_completion/"jcli").write output
    
    # Install zsh completion
    output = Utils.popen_read("#{bin}/jcli completion --type zsh")
    (zsh_completion/"_jcli").write output
    
    prefix.install_metafiles
  end

  test do
    version_output = shell_output("#{bin}/jcli version")
    assert_match version.to_s, version_output
  end
end
