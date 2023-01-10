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
- url: https://prometheus-prod-***********.grafana.net/api/prom/push
  basic_auth:
    username: <Your Grafana Cloud Prometheus Username>
    password: <Your Grafana Cloud API Key>
``` 

##### Prometheus URL Info
<img alt="find urls" height="880" src="../images/01-send-metrics.jpg" width="1000"/>

### Generating an API Key
Select `Generate now` under the section *Password / API Key* and follow the steps. Be sure to save the API key for later steps, as you will not be able to retrieve it after navigating away from this screen.

Ensure the API Key has the `Role` of `MetricsPublisher`
#### Generate API Key
<img alt="generate-key" height="880" src="../images/02-url-user-key.jpg" width="1000"/>

## Astra DB Setup
Select the database you created in the prerequsites, and select the `Settings` tab. Then, select `Add Destination`
#### Settings
<img alt="settings" height="730" src="../images/03-astra-settings.jpg" width="1000"/>

#### Add Destination
<img alt="destination" height="730" src="../images/04-astra-add-destination.jpg" width="1000">

#### Enter Prometheus Info
Retrieve the Grafana Cloud `username` and `API Key` above and fill in the `Prometheus Username` and `Prometheus Password` respectively.

Use the `Prometheus Write Endpoint` URL as noted in the [Generating an API Key]() section above.

<img src="../images/05-astra-prom-info.jpg" alt="prom info" width="1000" height="738">

## Grafana Dashboard Setup
<img src="../images/06-grafana-dashboard.jpg" alt="prom info" width="1000" height="650">

### Import Dashboard
<img src="../images/07-grafana-dashboard-import.jpg" alt="prom info" width="1000" height="552">

Copy the entire `JSON` body from the file `labs/grafana-astra-dashboard.json` and paste into `Import via panel json`. 

<img src="../images/08-grafana-import-json.jpg" alt="prom info" width="1000" height="552">

### Working Metrics
You should begin to see metrics flowing to your dashboard that roughly resembles the Astra UI Health Tab. 

<img src="../images/09-grafana-working-dashboard.jpg" alt="prom info" width="1000" height="552">