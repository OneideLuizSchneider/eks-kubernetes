## Amazon Elastic Kubernetes Service(EKS) Cluster with Terraform 

- In this example we're going to use NodeGroups.
- We need a IAM permission for this, with full access to EC2, EKS and IAM Policies.

#### Steps

- Configure AWS Cli `aws configure`
- Configure the variables on `./terraform/variables.tf`:
  - Add AWS Keys and Region
  - Configure the VPC ID and Subnets
  - Configure the instance type, example `t2.small`
  - Configure Cluster nome as you wish
  - Configure K8s version, example `1.20`
  - Configure/change whatever you want :D
- `terraform init`
- `terraform plan`
- `terraform apply`

#### Generate kubeconfig

- Create kubeconfig automatically:
  - `aws eks --region <region-code> update-kubeconfig --name <cluster_name>`
- Create kubeconfig manually:
  - Look at Terraform outputs manually or run the command below again:
  - `terraform output`
  - Copy the outputs and change the template file `./files/kubeconfig-template.yml`
  - Documentation: <https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html>
- Optional:
  - Managing users or IAM roles for your cluster
  - Describe the aws auth configmap:
    - `kubectl describe configmap -n kube-system aws-auth`
  - Now add your user ARN:
    ```
    mapUsers: |
    - userarn: <arn:aws:iam::111122223333:user/admin>
      username: <admin>
      groups:
        - <system:masters>
    ```
  - To add full access to the Cluster you need to create a Cluster Role first
    - `kubectl apply -f ./files/eks-console-full-access.yaml`
    - Now add this group to your user on the configmap `aws-auth`
  - To give access to an specific namespace, run the command bellow, this yaml is applying to the namespace `default`.
    - `kubectl apply -f ./files/eks-console-restricted-access.yaml` 
  - Documentation: <https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html>

\
\
AWS Official Documentation: <https://docs.aws.amazon.com/eks/index.html>
\
Terraform Official Documentation: <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster>
