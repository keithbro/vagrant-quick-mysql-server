Exec {
  path => "/usr/bin",
}

class { '::mysql::server':
  override_options => { 'mysqld' => { 'bind-address' => '0.0.0.0' } },
  restart => true,
}

mysql_grant { 'root@*/*.*':
  ensure     => 'present',
  options    => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'root@%',
  require    => Class['::mysql::server'],
}
