# Terraforming S3 with static website enabled

    
    terraform workspace new dev
    terraform init
    terraform plan -out tf.tfplan
    terraform apply tf.tfplan
