terraform { 
  backend "remote" { 
    
    hostname = "app.terraform.io"
    organization = "ZenithCloud"

    workspaces { 
      name = "gcp_terraform_repo" 
    } 
  } 
}
