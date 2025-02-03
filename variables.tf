variable "platform" {
  description                     = "Platform metadata configuration object."
  type                            = object({
    client                        = string 
    environment                   = string
  })
}

variable "suffix" {
  description                     = "Naming suffix to apply to resources"
  type                            = string
}