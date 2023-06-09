output "id" {
  description = "Glue catalog database ID"
  value       = aws_glue_catalog_database.this.id
}

output "name" {
  description = "Glue catalog database name"
  value       = aws_glue_catalog_database.this.name
}

output "arn" {
  description = "Glue catalog database ARN"
  value       = aws_glue_catalog_database.this.arn
}