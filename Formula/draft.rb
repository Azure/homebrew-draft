class Draft < Formula
  desc "A tool for developers to create cloud-native applications on Kubernetes."
  homepage "https://github.com/Azure/draft"
  version "0.12.0"
  url "https://azuredraft.blob.core.windows.net/draft/draft-v#{version}-darwin-amd64.tar.gz"
  sha256 "5caa5cc89d81f193615e3ad55f2c08be59052c3309f7c37d0ed0136d54b82228"

  depends_on "kubernetes-helm" => :recommended

  def caveats; <<~EOS
    Be aware that Draft is currently experimental and does not have a stable
    release yet. We make no backwards-compatible guarantees between releases.

    When upgrading, make sure to `rm -rf ~/.draft` before bootstrapping Draft
    according to the installation guide:

      https://github.com/Azure/draft/blob/v#{version}/docs/install.md

    If you bootstrapped an application using `draft create`, you'll also
    want to remove the files `draft create` generated before running
    `draft create && draft up` again.

    Please make sure to read the release notes for further information:

      https://github.com/Azure/draft/releases/tag/v#{version}
    EOS
  end

  def install
    bin.install name
  end

  test do
    system bin/name, "version", "--client"
  end
end
