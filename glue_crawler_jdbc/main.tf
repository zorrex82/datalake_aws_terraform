resource "aws_glue_crawler" "this" {
  name          = local.name
  database_name = var.database_name
  description   = var.crawler_description
  role          = local.name_role

  configuration = jsonencode(
    {
      Grouping = {
        TableGroupingPolicy = "CombineCompatibleSchemas"
      }
      CrawlerOutput = {
        Partitions = { AddOrUpdateBehavior = "InheritFromTable" }
      }
      Version = 1
    }
  )

  jdbc_target {
    connection_name = var.jdbc_connection
    path            = var.jdbc_path
  }
}