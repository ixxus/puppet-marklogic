# == class marklogic::version::v6::upgrade
#
# This class handles the activation of MarkLogic version 6 as an upgrade.
#
# === Requires
#  [*puppetlabs-stdlib*](https://github.com/puppetlabs/puppetlabs-stdlib)
#  [*puppetlabs-firewall*](https://github.com/puppetlabs/puppetlabs-firewall)
#
# === Parameters
#
# === Examples
#
# This class should not be called directly. It inherits the base activator.
#
# === Authors
#
# Marcus Young <myoung34@my.apsu.edu>
#
class marklogic::version::v6::upgrade inherits marklogic::activator {
  exec { 'manually_restart_service':
    command     => $restart_service_cmd,
    notify      => Exec['accept_license'],
    path        => $::path,
    refreshonly => true,
    subscribe   => Package['MarkLogic'],
  }
  exec { 'accept_license':
    command     => $accept_cmd,
    notify      => Exec['upgrade_databases'],
    path        => $::path,
    refreshonly => true,
  }
  exec { 'upgrade_databases':
    command     => $security_upgrade_cmd,
    path        => $::path,
    refreshonly => true,
  }
}
