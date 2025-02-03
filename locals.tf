locals {
    documents                       = {
        commands                    = {
            for f in fileset("${path.module}/documents/commands", "*.yaml"):
                split(".", f)[0]    => file("${path.module}/documents/commands/${f}")
        }
    }

    name                            = upper(join("-", [module.platform.prefix,
                                        var.suffix
                                    ]))

    tags                            = merge(var.build.tags, module.platform.tags)

}