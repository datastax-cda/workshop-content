# Prometheus & Grafana Cloud
In this lab we will setup Astra DB third party metrics exporting, and ship metrics to a Prometheus server hosted in Grafana Cloud.
## Prerequsites
- [ ] Free [Astra DB](https://astra.datastax.com) account
- [ ] Free [Grafana Cloud](https://grafana.com/auth/sign-up/create-user?pg=login) account
- [ ] Create an [Astra DB instance](https://astra.datastax.com/org/292fde42-ced8-4d4a-ae21-e61226f03f2d/guide/overviewOfAstraDB#How-to-Create-an-Astra-database-with-the-UI-%F0%9F%94%A5)
## Grafana & Prometheus Setup
You will need the following information to enable metrics export from Astra DB. 
```yaml
remote_write:
- url: https://prometheus-prod-10-prod-us-central-0.grafana.net/api/prom/push
  basic_auth:
    username: <Your Grafana Cloud Prometheus Username>
    password: <Your Grafana Cloud API Key>
``` 

It can be found here

<img alt="find urls" height="880" src="../images/01-send-metrics.jpg" width="1000"/>

### Generating an API Key
Select `Generate now` under the section *Password / API Key* and follow the steps.
#### Generate API Key
<img alt="generate-key" height="880" src="../images/02-url-user-key.jpg" width="1000"/>

## Astra DB Setup
Select the database you created in the prerequsites, and select the `Settings` tab. Then, select `Add Destination`
#### Settings
<img alt="settings" height="730" src="../images/03-astra-settings.jpg" width="1000"/>

#### Add Destination
<img height="730" src="../images/04-astra-add-destination.jpg" width="1000">

#### 