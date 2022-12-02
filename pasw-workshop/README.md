# Pivotal Application Services for Windows Workshop 

Workshop to introduce the basics of PAS to a .NET savvy group. The workshop creates and pushes a .NET Core app to either a Windows Cell or Linux Cell. All labs are run on a Windows desktop and assume powershell is accessible (by default it is on Windows).

## Pre-requisites

If you choose the labs using Windows Cell, the foundation to run the demo must have PASW deployed. This gives you Windows Diego Cells which the manifests provided in the Visual Studio Templates assume are present.

The Workshop assumes the Students have been given the following:
 - **API URL** of the Workshop foundation
 - URL of **App Manager**
 - **User name** and **password** to login to the foundation
 - **Org and Space** associated with the user account

There is a sample worksheet in the [Field Collateral/PASW Workshop](https://drive.google.com/open?id=1ajWGLFQ2aE0Ta7iN3hF0jGwDp73VZt9P) folder to use.

### Intro & Creds Lab

An initial step for the Student to gather needed PAS info
 - API URL
 - AppManager URL
 - Per-loaded credentials from a gSheet for PAS

### Setup Environment

A step to verify the Student has the correct software and cli's loaded, provides some workarounds for Student's with limited desktop permissions, and set a few local environment variables with their creds (that are used in future labs).

### Create Microservice

The Student opens Visual Studio and creates a new project based on the public Steeltoe Cloud Foundry templates.

### Push Microservice

Using Visual Studio the Student publishes the new microservice app (which creates the artifact), reviews the manifest provided in the template, and executes `cf push`.

### Explore Applications Manager

A step by step to log in to App Manager and understand Org/Space navigation, get to the home page of a deployed app, and discover the marketplace.

### Attach an autoscaler

Using App Manager the Student is guided through the marketplace to attach an autoscaler to their app and set a scaling rule.

### Add a new route

Using App Manager the Student is guided through attaching a new route to their app.

### Next Steps

A "congrats" note to the student for completing the workshop, and a reminder to continue learning about cloud native .NET with the Steeltoe Workshop. There is also an offer to experience all the examples in the Steeltoe public repo on Pivotal Web Services

### Join Workshops

If you would like to remove the Next Steps lab and join this workshop to another, look in the transition-pages PACE content.

## Config.json with labs for Windows Diego
```json
{
	"workshopSubject":"Pivotal Application Services for .NET",
	"workshopHomepage":"",
	"workshopHostname":"pasw-workshop-win",
	"modules": [
		{
			"type": "demos",
			"content": [
				{
					"name":"Introduction & Credentials",
					"filename":"pasw-workshop/labs/intro-creds"
				},
				{
					"name":"Setup Desktop Environment",
					"filename":"pasw-workshop/labs/setup-environment"
				},
				{
					"name":"Create .NET Core Microservice for Windows",
					"filename":"pasw-workshop/labs/create-microservice-win"
				},
				{
					"name":"Push Microservice to PASW",
					"filename":"pasw-workshop/labs/push-microservice"
				},
				{
					"name":"Explore Applications Manager",
					"filename":"pasw-workshop/labs/explore-appmanager"
				},
				{
					"name":"Setup Auto-Scaling",
					"filename":"pasw-workshop/labs/attach-autoscaler"
				},
				{
					"name":"Add a New Route",
					"filename":"pasw-workshop/labs/add-route"
				},
				{
					"name":"Next Steps",
					"filename":"pasw-workshop/labs/next-steps"
				}
			]
		}
	]
}
```

## Config.json with labs for Linux Diego
```json
{
	"workshopSubject":"Pivotal Application Services for .NET",
	"workshopHomepage":"",
	"workshopHostname":"pasw-workshop-linux",
	"modules": [
		{
			"type": "demos",
			"content": [
				{
					"name":"Introduction & Credentials",
					"filename":"pasw-workshop/labs/intro-creds"
				},
				{
					"name":"Setup Desktop Environment",
					"filename":"pasw-workshop/labs/setup-environment"
				},
				{
					"name":"Create .NET Core Microservice for Linux",
					"filename":"pasw-workshop/labs/create-microservice-linux"
				},
				{
					"name":"Push Microservice to PASW",
					"filename":"pasw-workshop/labs/push-microservice"
				},
				{
					"name":"Explore Applications Manager",
					"filename":"pasw-workshop/labs/explore-appmanager"
				},
				{
					"name":"Setup Auto-Scaling",
					"filename":"pasw-workshop/labs/attach-autoscaler"
				},
				{
					"name":"Add a New Route",
					"filename":"pasw-workshop/labs/add-route"
				},
				{
					"name":"Next Steps",
					"filename":"pasw-workshop/labs/next-steps"
				}
			]
		}
	]
}
```