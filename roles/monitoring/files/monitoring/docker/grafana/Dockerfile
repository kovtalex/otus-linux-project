ARG GRAFANA_IMAGE=grafana/grafana:7.5.10
FROM ${GRAFANA_IMAGE}

COPY --chown=grafana:root datasources /etc/grafana/provisioning/datasources
COPY --chown=grafana:root dashboards /etc/grafana/provisioning/dashboards
