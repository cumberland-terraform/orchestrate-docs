resource "aws_ssm_document" "commands" {
    for_each                = local.documents.commands
    
    document_type           = "Command"
    content                 = each.value
    name                    = join("-", [local.name, each.key])
    tags                    = local.tags
}

resource "aws_ssm_document" "automation" {
    for_each                = local.documents.automation

    document_type           = "Automation"
    content                 = each.value
    name                    = join("-", [local.name, each.key])
    tags                    = local.tags
}

resource "aws_ssm_document" "policy" {
    for_each                = local.documents.automation

    document_type           = "Policy"
    content                 = each.value
    name                    = join("-", [local.name, each.key])
    tags                    = local.tags
}