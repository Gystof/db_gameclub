FROM postgres:latest

COPY schema.sql /docker-entrypoint-initdb.d/
COPY prometheus.yml /etc/prometheus/prometheus.yml
COPY grafana.ini /etc/grafana/grafana.ini



EXPOSE 5432 9090 3000

CMD service postgresql start && \
    service prometheus start && \
    service grafana-server start && \
    tail -f /var/log/postgresql/postgresql-12-main.log
