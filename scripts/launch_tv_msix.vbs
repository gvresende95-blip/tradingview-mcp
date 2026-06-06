Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Path to TradingView MSIX executable
tvPath = "C:\Program Files\WindowsApps\TradingView.Desktop_3.2.0.7916_x64__n534cwy3pjxzj\TradingView.exe"

' Check if exists
If Not objFSO.FileExists(tvPath) Then
    WScript.Echo "Error: TradingView.exe not found at: " & tvPath
    WScript.Quit 1
End If

' Launch with CDP port
objShell.Run """" & tvPath & """ --remote-debugging-port=9222", 1, False

WScript.Echo "TradingView launched with --remote-debugging-port=9222"
WScript.Echo "Waiting for CDP to initialize..."
WScript.Sleep 5000

WScript.Quit 0
