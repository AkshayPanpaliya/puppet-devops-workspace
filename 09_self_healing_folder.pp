# self_healing.pp
# Level 9: Self-Healing Data Pipeline Folder

# 1️⃣ Ensure folder exists
file { 'C:/Incoming_Data':
  ensure  => directory,
  owner   => 'HP',           # Replace with your admin or creator account
  group   => 'Users',
  mode    => '0755',
}

# 2️⃣ Apply ACL so only data_analyst can write
# Requires puppetlabs-acl module: puppet module install puppetlabs-acl
acl { 'Incoming_Data_permissions':
  target        => 'C:/Incoming_Data',
  permissions   => [
    { identity => 'data_analyst', rights => ['full'], affects => 'all' },
  ],
  purge         => true,
  require       => File['C:/Incoming_Data'],
}
