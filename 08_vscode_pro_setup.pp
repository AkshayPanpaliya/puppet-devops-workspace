# 08_vscode_pro_setup.pp
# Level 8: Visual Studio Code "Pro" Setup
# Purpose: Install VS Code and Python extension via Puppet
# Author: Your Name

# 1️⃣ Install VS Code via Chocolatey
package { 'vscode':
  ensure   => installed,
  provider => chocolatey,
}

# 2️⃣ Install Python extension using VS Code CLI
exec { 'install_python_extension':
  command => 'cmd /c "code --install-extension ms-python.python"',
  path    => ['C:/Program Files/Microsoft VS Code/bin', 'C:/Windows/System32', 'C:/Windows'],
  unless  => 'cmd /c "code --list-extensions | findstr ms-python.python"',
  require => Package['vscode'],
}
