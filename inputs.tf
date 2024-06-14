variable "vnet_network_cidr" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "This is virtual network cidr range"

}

variable "subnet_cidr_range" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  description = "These are subnet cidr ranges"

}

variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app", "db"]
  description = "These are subnet names"
}

# variable "app_subnet_name" {
#   type        = string
#   default     = "app"
#   description = "This is app subnet name"
# }



variable "webnsg_config" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
  })
  default = {
    name = "webnsg"
    rules = [{
      name                       = "openhttp"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = "300"
      direction                  = "Inbound"
      },
      {
        name                       = "openssh"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = "310"
        direction                  = "Inbound"
    }]
  }
}

variable "appnsg_config" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
  })
  default = {
    name = "appnsg"
    rules = [{
      name                       = "open8080"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8080"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = "300"
      direction                  = "Inbound"
      },
      {
        name                       = "openssh"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = "310"
        direction                  = "Inbound"
    }]
  }
}


variable "dbnsg_config" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      access                     = string
      priority                   = string
      direction                  = string

    }))
  })
  default = {
    name = "dbnsg"
    rules = [{
      name                       = "open3306"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3306"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      access                     = "Allow"
      priority                   = "300"
      direction                  = "Inbound"
      },
      {
        name                       = "openssh"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = "310"
        direction                  = "Inbound"
    }]
  }
}

variable "db_info" {
  type = object({
    db_name        = string
    server_name    = string
    server_version = string
    user_name      = string
    password       = string
    max_size_gb    = string
    sku_name       = string

  })
  default = {
    db_name        = "employer"
    server_name    = "ntierserver"
    server_version = "12.0"
    user_name      = "Dell"
    password       = "my@india@123"
    max_size_gb    = "2"
    sku_name       = "Basic"
  }

}

variable "appvm_config" {
  type = object({
    app_subnet_name               = string
    public_ip_name                = string
    allocation_method             = string
    network_interface_name        = string
    ip_name                       = string
    private_ip_address_allocation = string
    appvm_name                    = string
    username                      = string
    size                          = string
    public_key_path               = string
    publisher                     = string
    offer                         = string
    sku                           = string
    version                       = string

  })
  default = {
    app_subnet_name               = "app"
    allocation_method             = "Static"
    public_ip_name                = "publicip"
    network_interface_name        = "ntier_nifc"
    ip_name                       = "nifc_ip"
    private_ip_address_allocation = "Dynamic"
    appvm_name                    = "appvm"
    username                      = "Dell"
    size                          = "Standard_B1s"
    public_key_path               = "~/.ssh/id_rsa.pub"
    publisher                     = "Canonical"
    offer                         = "0001-com-ubuntu-server-jammy"
    sku                           = "22_04-lts-gen2"
    version                       = "latest"
  }
}