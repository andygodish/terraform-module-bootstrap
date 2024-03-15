cp -r /module/. /copy/

rm /copy/dockerfile
rm /copy/entrypoint.sh

cat > /copy/README.md <<EOF
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
EOF

chown appuser:appgroup -R /copy

