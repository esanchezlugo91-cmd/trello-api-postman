@echo off
setlocal
echo.
echo ====================================================================
echo  Iniciando Pruebas Automatizadas de Postman con Newman HTML Extra
echo ====================================================================
echo.

:: Configuración de Archivos y Reportes
set COLECCION=apiTrello.postman_collection.json
set AMBIENTE=apiTrello.postman_environment.json
set TITULO_REPORTE="Reporte_Trello_Framework"
set NOMBRE_REPORTE="Reporte_Trello_Framework.html"

:: Credenciales (Hardcoded como solicitado)
set TRELLO_KEY=""
set TRELLO_TOKEN=""

echo [INFO] Usando Coleccion: %COLECCION%
echo [INFO] Usando Ambiente: %AMBIENTE%
echo [INFO] Titulo del Reporte: %TITULO_REPORTE%
echo [INFO] Generando archivo: %NOMBRE_REPORTE%
echo.
echo [INFO] Ejecutando pruebas y validaciones de esquema...

npx newman run "%COLECCION%" -e "%AMBIENTE%" ^
--env-var "url_base=https://api.trello.com/1" ^
--env-var "api_key=%TRELLO_KEY%" ^
--env-var "token=%TRELLO_TOKEN%" ^
-r htmlextra,cli --reporter-htmlextra-darkTheme ^
--reporter-htmlextra-title %TITULO_REPORTE% ^
--reporter-htmlextra-export "./%NOMBRE_REPORTE%"

echo.
echo ====================================================================
echo  Ejecucion finalizada.
echo  Verifica el archivo '%NOMBRE_REPORTE%' en tu carpeta local.
echo ====================================================================
echo.
pause
endlocal
