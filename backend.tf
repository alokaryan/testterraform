terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "networknuts-jenkins-terra-states"
    key = "state.tfstate"
   }
}
