#

[CmdletBinding()]
param (
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=0)][string]$type,
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=1)][string]$file,
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=2)][array]$params
);

$APP_PATH = split-path -parent $MyInvocation.MyCommand.Definition
if ($type -eq "script") {
   $SCRIPT_PATH = $APP_PATH + '\scripts\' + $( $file -replace ".{4}$") + '.ps1'
} elseif ($type -eq 'sql' ) {
   $SCRIPT_PATH = $APP_PATH + '\sql\' + $( $file -replace ".{4}$") + '.sql'
}

if (Test-Path -Path $SCRIPT_PATH) {
   $SCRIPT_VARS = @()
   $idx = 1
   foreach ($p in $params) {
      $SCRIPT_VARS += "P$idx='$p'"
      $idx += 1
   }
   if ($type -eq "script") {
      $output = powershell.exe $SCRIPT_PATH -Params $params
   } elseif ($type -eq "sql" ) {
      $output = Invoke-Sqlcmd -InputFile $SCRIPT_PATH -Variable $SCRIPT_VARS
      foreach ($p in $params) {
        $output.$p
      }
   }
} else {
   Write-Host "File doesn't exists"
   exit 1
}
