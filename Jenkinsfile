
pipeline {
    agent any
    tools {
 
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    
}
    parameters {
        string(name: 'WORKSPACE', defaultValue: 'development', description:'setting up workspace for terraform')
    }
    environment {
        TF_HOME = "terraform-0.12.7"
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
       // ACCESS_KEY = "AWS_ACCESS_KEY_ID"
        //SECRET_KEY = "AWS_SECRET_ACCESS_KEY"
    }
    stages {
            stage('TerraformInit'){
            steps {
                dir('./'){
                    sh "terraform init -input=false"
                    sh "echo \$PWD"
                    sh "whoami"
                }
            }
        }

       stage('TerraformFormat'){
            steps {
                dir('./'){
                   sh "terraform fmt"
                    //-list=true -write=false -diff=true -check=true"
               }
           }
        }

        stage('TerraformValidate'){
            steps {
                dir('./'){
                    sh "terraform validate"
                }
            }
        }

        stage('TerraformPlan'){
            steps {
                dir('./'){
                
                        sh "terraform plan" 
                }
            }
        }
      stage('Terraform Apply Approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and apply'
      }
    }
        stage('TerraformApply'){
            steps {
               
                 dir('./'){
                
                        sh "terraform apply" 
                }
            }
        }
         stage('Terraform Destroy Approval') {
      options {
        timeout(time: 1, unit: 'HOURS') 
      }
      steps {
        input 'approve the plan to proceed and destroy'
      }
    }
        stage('TerraformDestroy'){
            steps {
                dir('./'){
                
                        sh "terraform destroy" 
                }
            }
        }
    }
}
