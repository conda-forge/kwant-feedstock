:: replace PREFIX with the contents of the env var %PREFIX%
set build_template="%RECIPE_DIR%\build_windows.conf"
set setup_cfg="
set build_target="build.conf"

powershell -Command "(Get-Content -path %build_template% -Raw) -replace 'PREFIX','%PREFIX%' | Set-Content -Path %build_target%"
copy %RECIPE_DIR%\win-setup.cfg setup.cfg

:: debug
powershell -Command "Get-Content %build_target%"
powershell -Command "Get-Content setup.cfg"

%PYTHON% setup.py install --single-version-externally-managed --record=record.txt
