resource "aws_ssm_document" "commands" {
    for_each                = local.documents.commands
    
    document_format         = "YAML"
    document_type           = "Command"
    content                 = each.value
    name                    = upper(join("-", [local.name, each.key]))
    tags                    = local.tags
}

resource "aws_ssm_document" "automation" {
    for_each                = local.documents.automation

    document_format         = "YAML"
    document_type           = "Automation"
    content                 = each.value
    name                    = upper(join("-", [local.name, each.key]))
    tags                    = local.tags
}

resource "aws_ssm_document" "policies" {
    for_each                = local.documents.automation

    document_format         = "YAML"
    document_type           = "Policy"
    content                 = each.value
    name                    = upper(join("-", [local.name, each.key]))
    tags                    = local.tags
}