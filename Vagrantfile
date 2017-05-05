# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  [%w(debian bento/debian-8.7), %w(debian32 bento/debian-8.7-i386)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.provision :shell, inline: %(
        set -e
        echo "Installing rvm and ruby"
        export DEBIAN_FRONTEND=noninteractive
        curl -#LO https://rvm.io/mpapis.asc
        gpg --import mpapis.asc
        curl -sSL https://get.rvm.io | bash -s stable --ruby
        source /usr/local/rvm/scripts/rvm
        rvm use ruby --default
        gem install bundler

        echo "Preparing omnibus"
        apt-get -q -y  install git reprepro dpkg-sig fakeroot
        mkdir -p /var/lib/bundle
        mount -o bind /var/lib/bundle /vagrant/.bundle
        cd /vagrant
        bundle install --jobs=8
      )
    end
  end

  [%w(centos bento/centos-7.3), %w(centos32 jasonc/centos7-32bit)].each do |name, box|
    config.vm.define(name) do |c|
      c.vm.box = box

      c.vm.provision :shell, inline: %(
        set -e
        echo "%_signature gpg" > ~/.rpmmacros
        echo "%_gpg_name 7CC06B54" >> ~/.rpmmacros

        echo "Installing rvm and ruby"
        curl -#LO https://rvm.io/mpapis.asc
        gpg --import mpapis.asc
        curl -sSL https://get.rvm.io | bash -s stable --ruby
        source /usr/local/rvm/scripts/rvm
        rvm use ruby --default
        gem install bundler

        echo "Preparing omnibus"
        yum install -q -y git xz rpm-build fakeroot createrepo python27
        mkdir -p /var/lib/bundle
        mount -o bind /var/lib/bundle /vagrant/.bundle
        cd /vagrant
        bundle install --jobs=8
      )
    end
  end

  config.vm.synced_folder "~/.gnupg", "/root/.gnupg", owner: "root", group: "root", type: "rsync"

  config.vm.provider "virtualbox" do |vb|
    # TODO assign different amounts to 32-bit VMs
    vb.memory = 12288
    vb.cpus = 8
  end
end
