node 'compute-kiosk-01' {
  class { 'docker':
    docker_users => webops,
  }
}
