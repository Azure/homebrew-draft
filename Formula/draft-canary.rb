require 'formula'
require 'date'

class DraftCanary < Formula
  desc 'A tool for developers to create cloud-native applications on Kubernetes.'
  homepage 'https://github.com/Azure/draft'
  url 'https://azuredraft.blob.core.windows.net/draft/draft-canary-darwin-amd64.tar.gz'

  conflicts_with 'draft', :because => 'multiple version'

  def self.latest_draft_revision
    @latest_draft_revision ||= begin
      Date.parse(`curl --silent --HEAD https://azuredraft.blob.core.windows.net/draft/draft-canary-darwin-amd64.tar.gz | grep 'Last-Modified:'`.split(' ', 2).last.strip).to_s
    end
  end

  def self.sha256_checksum
    @sha256_checksum ||= begin
      `curl --silent https://azuredraft.blob.core.windows.net/draft/draft-canary-darwin-amd64.tar.gz.sha256`.split.first
    end
  end

  sha256 sha256_checksum
  version "canary-#{latest_draft_revision}"

  def install
    libexec.install 'draft'
    (bin/'draft').write_env_script(libexec/'draft', :DRAFT_HOME => etc/'draft')
  end

  def post_install
    system bin/'draft', 'init', '--client-only'
  end

  test do
    system bin/'draft', 'version', '--client'
  end
end
