class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.8.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "dbfdd0af8cc1106d80a5f56fe7700c9a9fc0aedbd1a7bcf7ec6df57218b41427"

  depends_on "kubernetes-helm" => :recommended
  conflicts_with 'draft-canary', :because => 'multiple version'

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
