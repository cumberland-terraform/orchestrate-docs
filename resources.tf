resource "aws_ssm_document" "commands" {
    for_each                = local.documents.commands
    
    document_type           = "Command"
    content                 = yamlencode(each.value)
    name                    = upper(join("-", [local.name, each.key]))
    tags                    = local.tags
}

resource "aws_ssm_document" "automation" {
    for_each                = local.documents.automation

    document_type           = "Automation"
    content                 = yamlencode(each.value)
    name                    = upper(join("-", [local.name, each.key]))
    tags                    = local.tags
}

resource "aws_ssm_document" "policies" {
    for_each                = local.documents.automation

    document_type           = "Policy"
    content                 = yamlencode(each.value)
    name                    = upper(join("-", [local.name, each.key]))
    tags                    = local.tags
}