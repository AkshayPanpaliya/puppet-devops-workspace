# jupyter.pp
# Level 7: Jupyter Lab Auto-Service
# Installs JupyterLab and creates a scheduled task to start it at boot

# 1️⃣ Install JupyterLab using pip
exec { 'install_jupyterlab':
  command => '"C:/Users/HP/AppData/Local/Programs/Python/Python310/python.exe" -m pip install jupyterlab',
  path    => ['C:/Windows/System32', 'C:/Windows'],
  unless  => '"C:/Users/HP/AppData/Local/Programs/Python/Python310/python.exe" -m pip show jupyterlab',
}

# 2️⃣ Create Scheduled Task to run JupyterLab at startup
exec { 'create_jupyter_task':
  command => 'schtasks /Create /SC ONSTART /TN "JupyterLabAutoStart" /TR "C:/Users/HP/AppData/Local/Programs/Python/Python310/python.exe -m jupyter lab --no-browser --port=8888" /RL HIGHEST /F',
  path    => ['C:/Windows/System32', 'C:/Windows'],
  unless  => 'schtasks /Query /TN "JupyterLabAutoStart"',
  require => Exec['install_jupyterlab'],
}
