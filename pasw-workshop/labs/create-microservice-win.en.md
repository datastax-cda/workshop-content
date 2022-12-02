# Create a .NET Core Microservice for Windows

## Goal

Using the installed Visual Studio templates, create a new app based on Steeltoe that is ready for Cloud Foundry Windows Diego cell.

## Prerequisites

- Visual Studio (min 2015)
- Internet Access

## Load the Steeltoe Template for Cloud Foundry

1. From the Visual Studio homepage, choose `File` then `New` then `Project`. This will bring up the "New Project" window. 

1. Choose `Installed` in the left panel and locate the search box at the top right. Type `steeltoe` in the search box. This will filter the installed project templates, to only those published by Steeltoe.

1. In the main panel locate the template named `Cloud Foundry w Steeltoe (.NET Core - Linux)` and click it.

1. Choose a name and location for the new project and click `ok` to create the project.

1. Be patient while the project is loaded and all needed packages are downloaded.

## Explore the project

1. The `ValuesContoller` class should be automatically opened. This class creates a few RESTful endpoints for use. Note the route that the class establishes: `/api/values/` and `/api/values/5`. We will use these once the app is pushed to PASW.

1. Open the `manifest.yml` file by double clicking. This file tells PASW how to containerize and deploy the app. It also provides details like how many instances to run, what services to bind, and establishes any custom environment variables.

  - name: is the name of the app that you use to reference it from the cf cli or in App Manager.
  - host: is part of the url to run the app.
  - instances: is the number of instances that PASW should deploy, of this app.
  - memory: is the amount of memory each app instance will be allowed.
  - disk_quota: is the amount of disk storage each app instance will be allowed.
  - buildpack: is how the app's container should be created and configured (runtime & system env vars).
  - stack: is what operating system to deploy the app instance to.
  - env: are environment variables the app should use during execution.

1. In the manifest, change the value of `name:` and `host:` to be something authentic (like your name). Keep it alpha-numeric and use `-`(dash) as a space.

1. Save the manifest file. The app is ready to be published and deployed to PASW!

## Complete

Now you have a .NET Core microservice ready for deployment. In the following step you will create the artifact and deploy.