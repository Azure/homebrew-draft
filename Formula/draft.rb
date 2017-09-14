class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.7.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "d413095540078b3d0ac3cbc13c4c214127b04a7126e90cb7cb624763002bf051"

  depends_on "kubernetes-helm" => :recommended
  conflicts_with 'draft', :because => 'multiple version'

  def install
    libexec.install name
    (bin/name).write_env_script(libexec/name, :DRAFT_HOME => etc/name)
  end

  def post_install
    system bin/name, "init", "--client-only"
  end

  test do
    system bin/name, "version", "--client"
  end
end
