#

[CmdletBinding()]
param (
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=0)][string]$type,
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=1)][string]$file,
    [Parameter(Mandatory=$False,ValueFromPipeline=$True,Position=2)][string]$params,
);

$APP_PATH = split-path -parent $MyInvocation.MyCommand.Definition
if ($type == 'script') {
   $SCRIPT_PATH = $APP_PATH + '/scripts/' + $( $file -replace ".{4}$") + '.ps1'
} else if ($type == 'sql' ) {
   $SCRIPT_PATH = $APP_PATH + '/sql/' + $( $file -replace ".{4}$") + '.sql'
}

if (Test-Path -Path $SCRIPT_PATH) {
   $SCRIPT_VARS = @()
   $idx = 1
   foreach ($p in $params) {
      $SCRIPT_VARS += "P$idx='$p'"
      $idx += 1
   }
   if ($type == 'script') {
      $output = powershell.exe $SCRIPT_PATH -Params $params
   } else if ($type == 'sql' ) {
      $output = Invoke-Sqlcmd -InputFile $SCRIPT_PATH -Variable $SCRIPT_VARS
   }
} else {
   exit 1
}
$output.$property
