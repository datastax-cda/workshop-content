# Lab 3 - Binding Services

In this lab, we'll learn about binding services.  In this case, we'll use a MySQL database as an example, but there are many other services available.

[Lab Instructions](https://github.com/Pivotal-Field-Engineering/pcf-ers-demo/blob/master/Labs/Services/lab_services.adoc)

Notes:

  * Replace `cf create-service p-mysql 100mb attendees-db` with `cf create-service p.mysql db-small attendees-db` in the instructions.
  * Once you have issued the `create-service` command, use `cf service attendees-db` to check the status of your service creation every minute or so.  This service creation will actually provision a new VM on Google Cloud Platform and run MySQL on it, thus it will take a few minutes.  You will see `create succeeded` in the status line when the service is done.
  * You cannot move on to the next step until after the service creation has succeeded.
