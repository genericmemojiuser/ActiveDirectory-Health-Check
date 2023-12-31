# Download RSAT from microsoft.com

$parameters = @{
    URI = "https://download.microsoft.com/download/1/"
    Outfile = "C:\WindowsTH-KB2693643-x64.msu"
}
Invoke-WebRequest @parameters

Test-Path -Path "C:\WindowsTH-KB2693643-x64.msu"

## Install RSAT

wusa.exe /install C:\WindowsTH-KB2693643-x64.msu /nonrestart

## Confirm RSAT shows up in Programs/Features
appwiz.cpl