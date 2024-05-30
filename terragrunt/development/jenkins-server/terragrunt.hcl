include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules/jenkins-server"
}

inputs = {
  #instance_type = "t2.micro"
  #instance_name = "example-server-stage"
}
