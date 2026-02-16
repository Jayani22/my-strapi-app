variable "image_tag" {
    type = string
}

variable "docker_username" {
    type = string
}

variable "private_key_path" {
    type        = string
    description = "Path to SSH private key"
}