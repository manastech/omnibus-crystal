# encoding: utf-8
name 'crystal-nightly'
friendly_name "Crystal (Nightly)"
maintainer 'Jonne Haß'
homepage 'http://crystal-lang.org/'
conflict 'crystal'

install_dir '/opt/crystal'
build_version do
  source :git, from_dependency: "crystal"
  output_format :semver
end
build_iteration 1

override :crystal, version: "master"

dependency 'crystal'
dependency 'tgz_package' if mac_os_x? || centos?

exclude '\.git*'
exclude 'bundler\/git'

package :deb do
  license "Apache-2.0"
end

package :rpm do
  license "Apache-2.0"
end

