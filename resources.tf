resource "aws_ssm_document" "commands" {
    for_each                = local.documents.commands
    document_type           = "Command"
    content                 = each.value
    name                    = join("-", [local.name, each.key])
    tags                    = local.tags
}