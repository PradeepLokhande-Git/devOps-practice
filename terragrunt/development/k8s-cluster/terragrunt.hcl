terraform {
  source = "../../../modules/k8s-cluster"
}
inputs = {
  instance_type = "t2.micro"
  instance_name = "example-server-stage"
}
