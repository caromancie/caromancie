@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo.
echo ===========================================
echo.
echo           C A R O M A N C I E
echo.
echo           -  avec Tonton  -    ^<3
echo.
echo ===========================================
echo.
echo   Installation automatique
echo   Salut Carole ! C'est parti...
echo.
echo -------------------------------------------
echo.

:: Verifier les droits admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERREUR] Droits admin requis !
    echo.
    echo Solution : Clic droit sur ce fichier -^> "Executer en tant qu'administrateur"
    echo.
    pause
    exit /b 1
)
echo [OK] Droits admin detectes
echo.

:: Verifier que winget est dispo
where winget >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERREUR] Le gestionnaire 'winget' n'est pas installe.
    echo.
    echo Mets a jour Windows ou installe 'App Installer' depuis le Microsoft Store,
    echo puis relance ce fichier.
    echo.
    pause
    exit /b 1
)
echo [OK] winget detecte
echo.

:: Verifier et installer Git
echo [..] Verification de Git...
git --version >nul 2>&1
if %errorLevel% neq 0 (
    echo [..] Installation de Git en cours (patience)...
    winget install -e --id Git.Git -h --accept-source-agreements --accept-package-agreements >nul 2>&1
    if !errorLevel! neq 0 (
        echo [ERREUR] Echec installation Git
        echo Telecharge manuellement : https://git-scm.com/download/win
        pause
        exit /b 1
    )
    echo [OK] Git installe !
) else (
    echo [OK] Git deja installe
)
echo.

:: Verifier et installer VS Code
echo [..] Verification de VS Code...
where code >nul 2>&1
set "VSCODE_USER=%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe"
set "VSCODE_MACHINE=%ProgramFiles%\Microsoft VS Code\Code.exe"
if %errorLevel% neq 0 if not exist "!VSCODE_USER!" if not exist "!VSCODE_MACHINE!" (
    echo [..] Installation de VS Code en cours (patience)...
    winget install -e --id Microsoft.VisualStudioCode -h --accept-source-agreements --accept-package-agreements >nul 2>&1
    if !errorLevel! neq 0 (
        echo [ERREUR] Echec installation VS Code
        echo Telecharge manuellement : https://code.visualstudio.com/
        pause
        exit /b 1
    )
    echo [OK] VS Code installe !
) else (
    echo [OK] VS Code deja installe
)
echo.

:: Aller a Documents
echo [..] Preparation du dossier...
cd /d "%USERPROFILE%\Documents" || (
    echo [ERREUR] Impossible d'acceder a Documents
    pause
    exit /b 1
)

:: Choisir le dossier de destination (sans rien detruire)
set "TARGET_DIR=%USERPROFILE%\Documents\caromancie"
if exist caromancie (
    echo [!] Le dossier 'caromancie' existe deja dans Documents.
    echo     On evite de toucher a ton travail existant.
    echo     On va installer dans : Documents\projets\caromancie
    echo.
    if not exist projets mkdir projets
    cd projets
    if exist caromancie (
        echo [ERREUR] Le dossier 'projets\caromancie' existe AUSSI deja.
        echo          Je ne touche a rien. Verifie avec Tonton Arnaud.
        pause
        exit /b 1
    )
    set "TARGET_DIR=%USERPROFILE%\Documents\projets\caromancie"
)
echo.

:: Cloner le repo
echo [..] Clonage du repo dans : !TARGET_DIR!
echo      (peut prendre 30 secondes)
git clone https://github.com/bobume/caromancie.git
if %errorLevel% neq 0 (
    echo [ERREUR] Echec du clonage
    echo Verifie ta connexion internet et reessaie
    pause
    exit /b 1
)
echo [OK] Repo clone !
echo.

:: Ouvrir dans VS Code (avec fallback sur chemin direct si PATH pas rafraichi)
echo [..] Ouverture du projet dans VS Code...
cd /d "!TARGET_DIR!"

where code >nul 2>&1
if %errorLevel% equ 0 (
    start "" code .
) else if exist "!VSCODE_USER!" (
    start "" "!VSCODE_USER!" .
) else if exist "!VSCODE_MACHINE!" (
    start "" "!VSCODE_MACHINE!" .
) else (
    echo.
    echo [!] VS Code installe mais pas trouvable automatiquement.
    echo     Ouvre VS Code a la main, puis : File -^> Open Folder
    echo     Et choisis : !TARGET_DIR!
    echo.
)

echo.
echo ===========================================
echo.
echo   Installation terminee !
echo   VS Code s'ouvre dans 2 secondes...
echo.
echo   Gros bisous, Tonton Arnaud  ^<3
echo.
echo ===========================================
echo.

timeout /t 2 /nobreak >nul
exit /b 0
