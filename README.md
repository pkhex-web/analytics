# PKHeX Web Analytics

This repository is designed to automate daily query execution and save their JSON representations to be used by [PKHeX.Web](https://pkhex-web.github.io/analytics).

## Purpose

The purpose of the analytics repository is to:

* Run queries stored under the /queries directory once every day.
* Save the JSON representation of the query results in the /data directory.

## Runnig

Running the queries is only possible by running this [pipeline](https://github.com/pkhex-web/analytics/actions/workflows/run-analytics.yml) or once every day at 3 AM UTC.
