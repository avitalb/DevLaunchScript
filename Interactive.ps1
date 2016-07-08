<#
.Synopsis
    Sets up a Node.js Tools for Visual Studio development environment from this branch.
    
.Parameter code
    [Optional] Launch instance of VS

.Parameter exp
    [Optional] Update TS language service and launch experimental instance of VS

#>

[CmdletBinding()]
param(
    [switch] $code,
    [switch] $exp
)

If (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Throw "You do not have Administrator rights to run this script. Please re-run as an Administrator."
}

if ($exp) {
    Start-Process "cmd.exe" "/c c:\src\TypeScript\VS\scripts\update-ls.cmd & devenv /RootSuffix Exp"
}

if ($code) {
    devenv NtvsInteractive\NtvsInteractive.sln
}