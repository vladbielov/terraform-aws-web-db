# terraform-iaac-2020
## Usage of this module 
### Create environments.tfvars file  with the following content

```
region                      =   "us-east-1"
cidr_block                  =   "10.0.0.0/16"

public_cidr1                =   "10.0.101.0/24"
public_cidr2                =   "10.0.102.0/24"
public_cidr3                =   "10.0.103.0/24"

private_cidr1               =   "10.0.1.0/24"
private_cidr2               =   "10.0.2.0/24"
private_cidr3               =   "10.0.3.0/24"

max_size                    =   "5"
min_size                    =   "1"
desired_capacity            =   "2"

tags    =   {
    Name                    =   "VPC_Project"
    Environment             =   "Dev"
    Team                    =   "DevOps"
    Department              =   "IT"
    Bill                    =   "CFO"
   
   }
```


### Please run 
``` 
terraform apply -var-file environment.tfvars