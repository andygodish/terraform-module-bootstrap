resource "" "this" {
  name = "-${local.uniq_name}${var.sub_prefix}-${var.app_prefix}-${var.app_env}-${local.location_abbr[var.location]}"
}