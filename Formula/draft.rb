class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.11.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "66ebe30fb2fbed704e1b45ee5192f731eff3c84fdd1b44a50745db30079acb8f"

  depends_on "kubernetes-helm" => :recommended

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
