# check if in venv environment
$current_pip_path = pip -V
$repo_name = (Get-Item $PSScriptRoot).Parent.Name
if ($current_pip_path -notmatch $repo_name)
{
    Write-Output "You're not an a venv environment, you probably should be"
    Exit
}

# build library
python -m build "$PSScriptRoot/.." --sdist --wheel

# install library
# todo parse version from setup.py
pip install --force-reinstall $PSScriptRoot/../dist/gdtoolkit-4.2.3-py3-none-any.whl