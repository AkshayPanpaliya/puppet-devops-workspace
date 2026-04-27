# drift_detector.pp
# Level 10: Drift Detector
# Goal: Set up Python, Git repo, and disable Sleep Mode

# 1️⃣ Install Python 3.11 via Chocolatey
package { 'python':
  ensure          => '3.11.6',
  provider        => chocolatey,
  install_options => ['--allow-downgrade'],
}

# 2️⃣ Clone GitHub repo (simulate if repo already exists)
exec { 'clone_ml_repo':
  command => 'git clone https://github.com/example/ml-project.git C:/ML_Workstation',
  path    => ['C:/Program Files/Git/cmd', 'C:/Windows/System32'],
  unless  => 'if exist C:\ML_Workstation (exit 0) else (exit 1)',
  require => Package['python'],
}

# 3️⃣ Registry tweak to disable Sleep Mode (Standby)
registry_value { 'DisableSleep':
  ensure => present,
  path   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\238C9FA8-0AAD-41ED-83F4-97BE242C8F20\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA',
  type   => dword,
  data   => '0',  # 0 = Disabled, 1 = Enabled
}
