
# 1️⃣ Install PostgreSQL package via Chocolatey
package { 'postgresql':
  ensure   => installed,
  provider => chocolatey,
}

# 2️⃣ Simulate service start using cmd /c
exec { 'simulate_postgres_service':
  command => 'cmd /c "echo PostgreSQL service would start here"',
  path    => ['C:/Windows/System32', 'C:/Windows'],
  require => Package['postgresql'],
}
