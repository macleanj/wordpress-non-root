FROM bitnami/mariadb:10.5.8

LABEL description="MariaDB image, incl runtime data"
LABEL maintainer="Jerome Mac Lean"

USER root

# Will be copied to the persistent storage before the "command"
COPY --chown=1001:0 ./mariadb /data
# TODO
RUN chmod -R 777 /data     # TODO
RUN chmod -R 777 /bitnami  # TODO

USER 1001