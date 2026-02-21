# Task 4: Security Auditor

# Disable Guest account
exec { 'disable_guest_account':
  command => 'net user Guest /active:no',
  unless  => 'net user Guest | findstr /C:"Account active               No"',
  path    => ['C:/Windows/System32'],
}

# Create data_analyst user (if not exists)
exec { 'create_data_analyst_user':
  command => 'net user data_analyst P@ssw0rd123 /add',
  unless  => 'net user data_analyst > nul 2>&1',
  path    => ['C:/Windows/System32'],
  require => Exec['disable_guest_account'],
}

# Ensure user is NOT administrator
exec { 'remove_data_analyst_from_admin':
  command => 'net localgroup Administrators data_analyst /delete',
  onlyif  => 'net localgroup Administrators | findstr data_analyst',
  path    => ['C:/Windows/System32'],
  require => Exec['create_data_analyst_user'],
}