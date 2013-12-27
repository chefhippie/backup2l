name "backup2l"
maintainer "Thomas Boerger"
maintainer_email "info@tbpro.de"
license "Apache 2.0"
description "Installs/Configures backup2l"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version "0.0.1"
recipe "backup2l", "Installs/Configures backup2l"

supports "debian", ">= 7.0"
supports "ubuntu", ">= 12.04"
