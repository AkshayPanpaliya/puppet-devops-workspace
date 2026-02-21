# Task 3: Environment Variable Injection

exec { 'set_data_path':
  command => 'setx DATA_PATH "C:\DS_Lab\Data" /M',
  unless  => 'reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v DATA_PATH',
  path    => ['C:/Windows/System32'],
}