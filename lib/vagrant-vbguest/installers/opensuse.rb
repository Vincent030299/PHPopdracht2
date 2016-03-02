module VagrantVbguest
  module Installers
    class OpenSuse < Linux
      # OpenSuse shows up as "suse", check for presence of the zypper
      # package manager as well.
      def self.match?(vm)
        :suse == self.distro(vm) && has_zypper?(vm)
      end

      # Install missing deps and yield up to regular linux installation
      def install(opts=nil, &block)
        communicate.sudo(install_dependencies_cmd, opts, &block)
        super
      end

    protected
      def self.has_zypper?(vm)
        communicate_to(vm).test "which zypper"
      end

      def install_dependencies_cmd
        "zypper --non-interactive install #{dependencies}"
      end

      def dependencies
        packages = ['kernel-devel', 'gcc', 'make', 'tar']
        packages.join ' '
      end
    end
  end
end
VagrantVbguest::Installer.register(VagrantVbguest::Installers::OpenSuse, 5)
