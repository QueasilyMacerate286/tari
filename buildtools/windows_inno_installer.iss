; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; Notes:
;  (1) To run this script from the command line, prepare the following:
;      - Install Microsoft Windows SDK 10 (https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk/)
;      - Add the Microsoft Windows SDK 10 folder where "signtool.exe" is located to the path, 
;        e.g. "C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x64"
;      - Install Inno Setup (https://jrsoftware.org/isinfo.php)
;  (2) To run this script from the command line with Inno Setup console-mode compiler:
;      - "<path to console-mode compiler>\ISCC.exe" "/SSignTool=signtool sign 
;         /tr http://timestamp.digicert.com /f "<path and filename of the certificate>" 
;         /p <password used to create the certificate> $f" 
;         "/DMyAppVersion=<base node version>" "windows_inno_installer.iss"
;  (3) To configure sign tools for Inno Script Studio:
;      - with 'Tools -> Configure Sign Tools...' (Example configuration), add
;        Name: 
;          SignTool 
;        Command: 
;          signtool sign /tr http://timestamp.digicert.com 
;          /f "<path and filename of the certificate>" 
;          /p "<password used to create the certificate>" $f


#define MyOrgName "Tari"
#define MyAppName "Base Node"
;#define MyAppVersion "?.?.?-???????-release"
#define MyAppPublisher "The Tari Development Community"
#define MyAppURL "https://github.com/tari-project/tari"
#define MyAppSupp "Tari Website"
#define MyAppSuppURL "http://www.tari.com"
#define MyAppExeName "start_tari_basenode.bat"
#define TorServicesName "Tor Services"
#define TorServicesExeName "start_tor.bat"
#define ReadmeName "README.txt"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{35C6E863-EDE5-4CBD-A824-E1418ECB1D1D}
AppName={#MyOrgName} {#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppSuppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userdocs}\..\.tari-testnet
DefaultGroupName={#MyOrgName} - Testnet
AllowNoIcons=yes
LicenseFile=..\LICENSE
OutputBaseFilename=tari_base_node-Windows-{#MyAppVersion}
SetupIconFile=.\tari_logo_black.ico
Compression=lzma
SolidCompression=yes
MinVersion=0,6.1
VersionInfoCompany=The Tari Developer Community
VersionInfoProductName=tari_base_node
InfoAfterFile="..\applications\tari_base_node\windows\README.md"
SignTool=SignTool

[CustomMessages]
TariGit=Tari on GitHub
TariWeb=Tari on the web

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "..\LICENSE"; DestDir: "{app}"; DestName: "LICENSE.md"; Flags: ignoreversion
Source: "..\LICENSE"; DestDir: "{app}"; DestName: "LICENSE.txt"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\README.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\README.md"; DestDir: "{app}"; DestName: "README.txt"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\start_tari_basenode.lnk"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\start_tor.lnk"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\target\release\tari_base_node.exe"; DestDir: "{app}\runtime"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\runtime\start_tari_basenode.bat"; DestDir: "{app}\runtime"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\runtime\start_tor.bat"; DestDir: "{app}\runtime"; Flags: ignoreversion
Source: "..\applications\tari_base_node\windows\runtime\run_the_base_node.bat"; DestDir: "{app}\runtime"; Flags: ignoreversion
Source: "..\common\config\presets\windows.toml"; DestDir: "{app}\config"; Flags: ignoreversion
Source: "tari_logo_purple.ico"; DestDir: "{userdocs}\..\temp\tari_icons"; Flags: ignoreversion
Source: "tor.ico"; DestDir: "{userdocs}\..\temp\tari_icons"; Flags: ignoreversion
Source: "install_sqlite.bat"; DestDir: "{app}\runtime"; Flags: ignoreversion
Source: "install_tor_services.bat"; DestDir: "{app}\runtime"; Flags: ignoreversion
Source: "install_vs2019_redist.bat"; DestDir: "{app}\runtime"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\runtime\{#MyAppExeName}"; WorkingDir: "{app}"
Name: "{group}\{#TorServicesName}"; Filename: "{app}\runtime\{#TorServicesExeName}"; WorkingDir: "{app}"
Name: "{group}\{#ReadmeName}"; Filename: "{app}\{#ReadmeName}"; WorkingDir: "{app}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:TariWeb,{#MyAppSupp}}"; Filename: "{#MyAppSuppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyOrgName} {#MyAppName} - Testnet}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyOrgName} {#MyAppName}"; Filename: "{app}\runtime\{#MyAppExeName}"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{commondesktop}\{#MyOrgName} - {#TorServicesName}"; Filename: "{app}\runtime\{#TorServicesExeName}"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Setup]
PrivilegesRequired=admin

[Run]
Filename: "{app}\runtime\install_sqlite.bat"; Description: "Install SQLite"; Parameters: "NO_PAUSE"; Flags: runascurrentuser postinstall 
Filename: "{app}\runtime\install_tor_services.bat"; Description: "Install Tor Services"; Parameters: "NO_PAUSE"; Flags: runascurrentuser postinstall 
Filename: "{app}\runtime\install_vs2019_redist.bat"; Description: "Install Redistributable for Visual Studio 2019"; Parameters: "NO_PAUSE"; Flags: runascurrentuser postinstall 
