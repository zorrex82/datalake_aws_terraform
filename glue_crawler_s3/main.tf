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

  s3_target {
    path = var.s3_target
  }
}