pipeline {
    agent any
    
    environment {
        MY_CRED = credentials('azureserviceprincipal')
    }

  stages {
        stage("Parameter Setup") {
            steps {
                script {
                    properties([
                        parameters([
                            choice(choices: ['apply', 'destroy'], description: 'Select an action', name: 'ACTION')
                        ])
                    ])
                }
            }
        }
    
        stage('GitTest'){
            steps{
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/cedric69lt/brief14']])
            }
        }
        
        stage('Docker Login') {
            steps {
                script {
                    sh 'docker login -u cedric69 -p dckr_pat_DoAhJ2z77EFh_ioo0PHaJBqKxIM' 
                }    
            }
        }
        
        stage ('Docker Build') {
            steps {
                script {
                    sh 'cd application && docker build -t cedric69-imagebrief14 .'
                }    
            }
        }

        stage ('Docker Tag') {
            steps {
                script {
                    sh 'cd application && docker tag cedric69-imagebrief14 cedric69/imagebrief14'
                }
            }
        }


        stage ('Docker Push') {
            steps {
                script {
                    sh 'cd application && docker push cedric69/imagebrief14'        
                }    
            }
        }
        
        stage ('Terraform Init') {
            steps {
                script {
                    sh "cd stagingEnvironment && terraform init"
                }                
            }
        }
        
        stage('Connection') {
            steps {
                sh 'az login --service-principal -u $MY_CRED_CLIENT_ID -p $MY_CRED_CLIENT_SECRET -t $MY_CRED_TENANT_ID'
            }
        }
        
    
        stage ('Terraform Plan') {
            steps {
                script {
                    sh "cd stagingEnvironment &&  terraform plan"
                }
            }
        }
        

        stage ('Terraform Apply') {
            steps {
                script {
                    sh "cd stagingEnvironment && terraform ${params.ACTION} --auto-approve"
                }    
            }
        }   


                stage ('Terraform-Init') {
            steps {
                script {
                    sh "cd ProdEnvironment && terraform init"
                }                
            }
        }
    
        stage ('Terraform-Plan') {
            steps {
                script {
                    sh "cd ProdEnvironment && terraform plan"
                }
            }
        }

        stage ('Terraform-Apply') {
            steps {
                script {
                    sh "cd ProdEnvironment && terraform apply -auto-approve"
                }    
            }
            }
        }  
   }
