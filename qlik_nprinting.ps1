$repoPass = Password123
$adminName = admin
$adminEmail = florence.vinyo@mantech.com
$adminPass = Password123

if (!(Test-Path "C:\QlikNPrintingServer_x64.exe")) {
    Invoke-WebRequest "https://da3hntz84uekx.cloudfront.net/NPrinting/21.0.0/210000/_MSI/QlikNPrintingServer_x64.exe" -OutFile 
	"C:\QlikNPrintingServer_x64.exe"
    Unblock-File -Path "C:\QlikNPrintingServer_x64.exe"
}


# Load windows forms for sending keyboard presses
$Null = [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')

# Add static method for switching window focus
Add-Type -Language CSharp -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class WinAp {
      [DllImport("user32.dll")]
      [return: MarshalAs(UnmanagedType.Bool)]
      public static extern bool SetForegroundWindow(IntPtr hWnd);

      [DllImport("user32.dll")]
      [return: MarshalAs(UnmanagedType.Bool)]
      public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }
"@

# Start exe and capture process info
$NewProc = Start-Process -FilePath "C:\QlikNPrintingServer_x64.exe" -PassThru

# Wait for program to start
Start-Sleep -Seconds 5

# Switch window focus to exe process
$Null = [WinAp]::SetForegroundWindow($NewProc.MainWindowHandle)
$Null = [WinAp]::ShowWindow($NewProc.MainWindowHandle,3)

#Navigate initial UI
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait(" ")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait(" ")

#Hardcoded wait for installer to update screen, may depend on hardware.
Start-Sleep -Seconds 7

#Repo Password
[System.Windows.Forms.SendKeys]::SendWait(" ")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("$repoPass")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("$repoPass")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait(" ")

#Hardcoded wait for installer to update screen, may depend on hardware.
Start-Sleep -Seconds 2

#Admin Username and Password
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
#username
[System.Windows.Forms.SendKeys]::SendWait("$adminName")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
#email
[System.Windows.Forms.SendKeys]::SendWait("$adminEmail")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
#password
[System.Windows.Forms.SendKeys]::SendWait("$adminPass")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
#repeat password
[System.Windows.Forms.SendKeys]::SendWait("$adminPass")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait(" ")

#install
[System.Windows.Forms.SendKeys]::SendWait(" ")


