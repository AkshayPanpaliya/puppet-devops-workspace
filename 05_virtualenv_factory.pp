# Task 5: Virtual Environment Factory

exec { 'create_venv':
  command  => '"C:/Python311/python.exe" -m venv C:/DS_Lab/venv',
  creates  => 'C:/DS_Lab/venv',
  provider => windows,
  path     => ['C:/Windows/System32'],
}