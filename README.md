# AWS IaC with Terraform: Move Resources between State Files

## Lab Completion Summary

This lab demonstrates how to move a resource between Terraform state files using the `terraform state mv` command and `terraform import`.

### Completed Tasks

1. **Created Directory Structure**
   - `tf_code_1/`: Initial directory containing the IAM policy
   - `tf_code_2/`: Destination directory for the moved resource

2. **Initialized Remote State**
   - Configured S3 backend for both directories
   - Used bucket: `cmtr-g40pyt8i-backend-bucket-1760671425`
   - State files: `tf_code_1.tfstate` and `tf_code_2.tfstate`

3. **Resource Move Process**
   - Created IAM policy `custom_policy` in tf_code_1
   - Moved the resource from tf_code_1 state to tf_code_2 state
   - Updated configurations in both directories

4. **Configuration Updates**
   - Removed resource configuration from tf_code_1
   - Added resource configuration to tf_code_2
   - Updated outputs accordingly

5. **Validation**
   - Ran `terraform plan` on both configurations - no changes detected
   - Ran `terraform validate` - all configurations valid
   - Ran `terraform fmt` - code properly formatted

### Final State

- **tf_code_1**: Empty state, no resources managed
- **tf_code_2**: Contains `aws_iam_policy.custom_policy` resource
- **AWS Infrastructure**: IAM policy remains unchanged in AWS

### Key Files

- `tf_code_1/`: Contains Terraform configuration without the IAM policy
- `tf_code_2/`: Contains Terraform configuration with the IAM policy
- Both directories have proper `versions.tf`, `variables.tf`, `terraform.tfvars`, `main.tf`, and `outputs.tf`

### Verification Commands Used

```bash
# Initialize with remote backend
terraform init -backend-config="bucket=cmtr-g40pyt8i-backend-bucket-1760671425" -backend-config="key=tf_code_X.tfstate" -backend-config="region=us-east-1"

# Import existing resource
terraform import aws_iam_policy.custom_policy arn:aws:iam::711387095307:policy/custom_policy

# Validate and format
terraform validate
terraform fmt

# Verify no changes
terraform plan
```

The lab successfully demonstrates resource state management without affecting the actual AWS infrastructure.