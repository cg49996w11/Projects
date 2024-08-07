1)Update all variables in terraform.tfvars:
    For lambda_handler variable in terraform.tfvars, use below format:
    lambda_handler = "{filename where source code is located without file extension}.{name of function defined in source code that responds to event}"

2)Update policy.json document with the policy that you want to associate with the lambda function role that will be created as    part of terraform run

3)If running locally, first run "terraform init".This will download all the required providers

4)Run terraform plan and review the plan

5)Run terraform apply after validating the plan generated in above step



