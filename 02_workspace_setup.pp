# Task 2: Automated Workspace

file { 'C:/DS_Lab':
  ensure => directory,
}

file { 'C:/DS_Lab/.gitignore':
  ensure  => file,
  content => "*.pyc\n__pycache__/\n.env\n",
  require => File['C:/DS_Lab'],
}

file { 'C:/DS_Lab/requirements.txt':
  ensure  => file,
  content => "numpy\npandas\nmatplotlib\nscikit-learn\n",
  require => File['C:/DS_Lab'],
}