FROM bitnami/wordpress:5.5.3

LABEL description="Wordpress image, incl runtime data"
LABEL maintainer="Jerome Mac Lean"

USER root

# Will be copied to the persistent storage before the "command"
COPY --chown=1001:0 ./wordpress /data
COPY --chown=1001:0 ./wordpress-home /data
# TODO
RUN chmod -R 777 /data

USER 1001
