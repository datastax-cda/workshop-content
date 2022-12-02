# Add a New Route

## Goal

From the home page of your app, in App Manager, add a second route to the app.

## Prerequisites

- Pushed app
- Internet Access
- Web Browser (Chrome, Firefox, Edge, Safari)(Not Internet Explorer)

## Add a new a route to your app

1. From the home page of your app, choose the "Route" tab. Notice there is one route attached to your app. It was created from the `Host` or `Name` value in the app's manifest.

1. Click the "Map A Route" button, to bring up the manage routes window.

1. The window gives you options for creating a new route or attaching an existing route to the app. Choose "Map a New Route" and provide a `Hostname` value. Keep it simple,  with something unique that no one else will use (like your name).

1. Click the "Map" button to create the route and automatically attach to your app. The window will close and you will see two routes listed, your existing and the one just created.

Now your app has 2 different URL's associated with it. Easy! You can click either route name to open the app in a different browser window.

If you had chosen to "Map an Existing Route" to your app, you would have the option to choose an existing route in the same Space. Route sharing is limited to an app's Space.

With more than one app attached to the same route, PAS will load balance requests based on the number of instances. For example, if app A and B are using the same route, app A is running 1 instance and app B is running 3 instances, then ~25% of the request traffic will go to app A and ~75% of the traffic will go to app B. This is a very easy way to transfer live traffic from one app version to another, as a zero downtime (blue/green) deployment!
