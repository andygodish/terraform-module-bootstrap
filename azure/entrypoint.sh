cp -r /module/. /copy/

rm /copy/dockerfile
rm /copy/entrypoint.sh

echo '<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->\n<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->' > README.md

chown appuser:appgroup -R /copy

