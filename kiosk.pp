node 'compute-kiosk-01' {
  
  user  { "webops": 
    ensure  => present,
    uid     => '1001',
  }

  package { 'screen': ensure => 'installed'}
  package { 'curl': ensure => 'installed'}
  package { 'lxde-core': ensure => 'installed'}

  class { 'vim':
    opt_bg_shading  => light,
  }
  
  class { 'docker':
    docker_users => 'webops',
  }
}
