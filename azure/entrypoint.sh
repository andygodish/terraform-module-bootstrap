cp -r /module/. /copy/

rm /copy/dockerfile
rm /copy/entrypoint.sh

chown appuser:appgroup -R /copy

