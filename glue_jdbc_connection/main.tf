resource "aws_glue_connection" "this" {
  name = local.name

  connection_type = "JDBC"

  physical_connection_requirements {
    availability_zone      = var.availability_zone
    security_group_id_list = var.security_group_id_list
    subnet_id              = var.subnet
  }


  connection_properties = {
    JDBC_CONNECTION_URL = var.connection_properties["string_connection"]
    USERNAME            = var.connection_properties["jdbc_user"]
    PASSWORD            = var.connection_properties["jdbc_pass"]
  }
}