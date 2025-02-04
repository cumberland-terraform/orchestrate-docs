output "documents" {
    description                 = "SSM Document Metadata"
    value                       = {
        automation              = aws_ssm_document.Automation
        commands                = aws_ssm_document.commands
        policies                = aws_ssm_document.policies
    }
}