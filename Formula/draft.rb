class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.11.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "ce7e60b98ab82d6c5590e365aed5d53dd421dedf726e68436ced57a80094a1dc"

  depends_on "kubernetes-helm" => :recommended

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
