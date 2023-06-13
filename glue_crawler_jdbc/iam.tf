resource "aws_iam_role" "glue_crawler_service_role" {
  name               = local.name_role
  description        = "Glue Crawler's Service Role"
  assume_role_policy = data.aws_iam_policy_document.glue_crawler_assume_role.json
  tags = {
    Name = local.name_role
  }
}

resource "aws_iam_role_policy_attachment" "glue_role_policy_attach" {
  role       = aws_iam_role.glue_crawler_service_role.name
  count      = length(var.iam_policy_glue)
  policy_arn = var.iam_policy_glue[count.index]
}
