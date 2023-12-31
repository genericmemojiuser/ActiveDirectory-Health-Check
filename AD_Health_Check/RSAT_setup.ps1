# Download RSAT from microsoft.com

$parameters = @{
    URI = "https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-KB2693643-x64.msu"
    Outfile = "C:\WindowsTH-KB2693643-x64.msu"
}
Invoke-WebRequest @parameters

Test-Path -Path "C:\WindowsTH-KB2693643-x64.msu"

## Install RSAT

wusa.exe /install C:\WindowsTH-KB2693643-x64.msu /nonrestart

## Confirm RSAT shows up in Programs/Features
appwiz.cpl

