ARG BUILD_FROM
FROM ${BUILD_FROM}

USER root
RUN (command -v jq >/dev/null 2>&1) || \
    (apk add --no-cache jq 2>/dev/null) || \
    (apt-get update && apt-get install -y --no-install-recommends jq && rm -rf /var/lib/apt/lists/*)

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
