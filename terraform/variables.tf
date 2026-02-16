variable "image_tag" {
    type = string
}

variable "docker_username" {
    type = string
    default = "jayani23"
}

variable "private_key_path" {
    type        = string
    default     = "../strapi-key-jayani.pem"
    description = "Path to SSH private key"
}