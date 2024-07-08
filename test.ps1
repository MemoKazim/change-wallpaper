cls
$files=$(ls D:\memes)
$index = $(Get-Random -Minimum 0 -Maximum $files.Length)
$random_name = $files[$index]

$path = "D:\memes\$random_name"
echo $path
$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc

[Wallpaper]::SetWallpaper($path)

echo $(whoami) , $(ipconfig /all | findstr IPv4), $(date) >> run.log
echo "-----------------------------------------------------" >> run.log

msg Student You just got trolled!!!

#rundll32.exe user32.dll,LockWorkStation