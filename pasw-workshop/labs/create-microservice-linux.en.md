# Create a .NET Core Microservice for Linux

## Goal

Using the `dotnet` cli, create a new app that can be deployed to a Linux Pivotal Application Service (PAS).

## Prerequisites

- Visual Studio Code
- .NET Core 2.2
- Internet Access

## Create a .NET Core Microservice

1. Open Visual Studio Code and open a new directory for your application. `File > Open...`

1. Open the Integrated Terminal provided in VS Code `Terminal > New Terminal` (Code blocks begining with `$> ` will indicate commands to be run in this terminal)

1. Initialize a new Web API project `$> dotnet new webapi`

## Explore the project

1. Open the `ValuesContoller` class, which can be found at the path `Controllers/ValuesController.cs`. This class creates a few RESTful endpoints for use. Note the route that the class establishes: `/api/values/` and `/api/values/5`. We will use these once the app is pushed to PAS.

1. Create a `manifest.yml` file at the root of the project. This file tells PAS or Pivotal Application Service for Windows (PASW) how to containerize and deploy the app. It also provides details like how many instances to run, what services to bind, and establishes any custom environment variables.

  - name: is the name of the app that you use to reference it from the cf cli or in App Manager.
  - host: is part of the url to run the app. (defaults to the value of `name`)
  - instances: is the number of instances of this application that should be deployed.
  - memory: is the amount of memory each app instance will be allowed.
  - disk_quota: is the amount of disk storage each app instance will be allowed.
  - buildpack: is how the app's container should be created and configured (runtime & system env vars).
  - stack: is what operating system to deploy the app instance to.
  - env: are environment variables the app should use during execution.

1. In the manifest, change the value of `name:` to be something authentic (like your name). Keep it alpha-numeric and use `-`(dash) as a space. Below is a minimal manifest file that you can use to build and deploy your application.

```yaml
---
applications:
-   name: <yourname>-steeltoe-app
    buildpack: https://github.com/cloudfoundry/dotnet-core-buildpack#v2.2.5
    instances: 1
    memory: 256M
```

1. To push your application to the Pivotal Application Service use the following commands, the first authenticates your Cloud Foundry CLI against the PAS instance, the second pushes your application to PAS.
```bash
$> cf login -a https://api.<SYSTEM_DOMAIN> -u <USERNAME> -p <PASSWORD> --skip-ssl-validation
$> cf push
```

1. Validate you microservice is working, navigate to the values controller GET method via the route that gets returned after the upload finishes. This url should look like `http://<yourname>-steeltoe-app.<APPS_DOMAIN>/api/values` and should return the value `["value1", "value2"]`.

## Complete

Now you have a .NET Core microservice ready for deployment. In the following step you will create the artifact and deploy.
