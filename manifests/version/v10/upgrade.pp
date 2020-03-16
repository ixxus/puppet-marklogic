# == class marklogic::version::v10::upgrade
#
# This class handles the activation of MarkLogic version 8 as an upgrade.
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
class marklogic::version::v10::upgrade inherits marklogic::activator {
  exec { 'upgrade_databases':
    command     => $security_upgrade_cmd,
    notify      => Exec['manually_restart_service'],
    path        => $::path,
    refreshonly => true,
    subscribe   => Package['MarkLogic'],
  }
  exec {'manually_restart_service':
    command     => $restart_service_cmd,
    path        => $::path,
    refreshonly => true,
  }
}
