name              "artifact-deployer"
maintainer        "Maurizio Pillitu"
maintainer_email  "maurizio@session.it"
license           "Apache 2.0"
description       "A Chef Cookbook that provides a simple way to download, unpack and configure artifacts"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.9.0"

supports          "ubuntu-12.04"
supports          "centos-6.6"
supports          "centos-7"

# Resolved by Berkshelf, not present in Supermarket or forked
depends "maven", '~> 1.2.0'
depends "file"

# Community cookbooks
# depends "python", "~> 1.4.6"
# depends 'apt', '~> 2.3.10'
# depends "ark", "~> 0.9.0"
# depends "resolver", "~> 1.2.0"
# depends "java", "~> 1.31.0"

depends "python", ">= 1.4.6"
depends 'apt', ">= 2.3.10"
depends "ark", ">= 0.9.0"
depends "resolver", ">= 1.2.0"
depends "java", ">= 1.31.0"

recipe 'artifacts', 'Installs artifacts'
recipe 'awscli', 'Installs Python awscli util'
recipe 'default', 'Invokes all other recipes'
recipe 'maven', 'Installs Apache Maven'
