locals {
    documents                       = {
        commands                    = {
            for f in fileset("${path.module}/documents/commands", "*.yaml"):
                split(".", f)[0]    => file("${path.module}/documents/commands/${f}")
        }
        automation                  = {
            for f in fileset("${path.module}/documents/automation", "*.yaml"):
                split(".", f)[0]    => file("${path.module}/documents/automation/${f}")
        }
        policy                      = {
            for f in fileset("${path.module}/documents/policy", "*.yaml"):
                split(".", f)[0]    => file("${path.module}/documents/policies/${f}")
        }
    }

    name                            = upper(join("-", [module.platform.prefix,
                                        var.suffix
                                    ]))

    tags                            = module.platform.tags

}