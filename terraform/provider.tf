provider {
    required_version {
        aws ={
            source = "hashicorp/aws"
            version = "6.16.0" 
       }
   }
}

provider "aws" {
    region = "us-east-1"
}