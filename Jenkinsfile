pipeline {
    agent any

    stages {
        stage('Clone Terraform Repo') {
            steps {
                echo 'Hello World'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/tosyno87/modern_3_tier_architecture.git']]])
        }}
        stage('Terraform Provision') {
            steps {
                sh """
                    cd terraform
                    terraform init
                    terraform plan
                    terraform apply --auto-approve
                """
                sh 'pwd'
            }
        }
        stage('Time to Kill?') {
            steps {
                input message: 'Destroy terraform resources?'
            }
        }
        stage('Search and Destroy') {
            steps {
                sh 'cd terraform; terraform destroy --auto-approve'
            }
        }
    }
}
