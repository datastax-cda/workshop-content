# Setup Desktop Environment

## Goal

The labs in this workshop make use of Visual Studio Code, .NET Core 2.2 SDK (dotnet cli), and the Cloud Foundry cli (cf cli). The following steps will confirm you have the correct configuration.

## Prerequisites

- Web Browser (Chrome, Firefox, Edge, Safari)(Not Internet Explorer)
- Internet connection

## Download Visual Studio Code

1. Download [Visual Studio Code](https://code.visualstudio.com/download)

1. Follow the installer for VS Code for your environment.

## Download and Validate .NET Core 2.2

1. Download the [.NET Core 2.2 SDK](https://dotnet.microsoft.com/download)

1. Follow the installer for VS Code for your environment.

1. To verify the installation, open a terminal (Bash, Powershell, etc) and type `dotnet --version`.

## Download and Validate cf cli
<!--
Another option for downloading the CF CLI would be to have them login to apps manager, click on "Tools" and download. This would ensure the CLI version is lined up with the platform they are working on. 
-->

1. Follow the instructions to install the [Cloud Foundry CLI](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html) for your operating system.

1. To verify your installation, open a Terminal (Bash, Powershell, etc) and type `cf --version`. If your installation was successful, the cf cli version is returned.

#### If you don't have permission to install the cli on Windows, download the cli executable

1. Download the [cli exe](https://packages.cloudfoundry.org/stable?release=windows64-exe&source=github).

1. Unpack the zip file.

1. Add the directory where `cf.exe` exists to your local user PATH.

1. To verify your installation, open powershell and type `cf`. If your installation was successful, the cf CLI help listing appears. You may need to restart the powershell window to see the cf cli help listing appear.

## Save your creds and API URL to environment variables

1. Open a powershell window and type in the following commands. Remember to replace the values below with your student creds that were assigned to you.

  ```bash
  $env:cf_api = "<PAS API URL>"
  $env:cf_username = "<Student User Name>"
  $env:cf_password = "<Student Password>"
  ```

## Complete

With Visual Studio Code, .NET Core 2.2 and the cf cli installed, you are ready to get started. Head on to the next lab.
