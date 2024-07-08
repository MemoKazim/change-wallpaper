wget https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/04/28/12/evil-kermit-meme.jpg?width=1200 -o "$HOME\Pictures\wallpaper.jpg"

$path = "$HOME\Pictures\wallpaper.jpg"

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

rm "$HOME\Pictures\wallpaper.jpg"

echo $(whoami) , $(ipconfig /all | findstr IPv4), $(date) >> run.log
echo "-----------------------------------------------------" >> run.log

msg Student You just got trolled!!!

rundll32.exe user32.dll,LockWorkStation