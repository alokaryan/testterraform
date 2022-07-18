pipeline {
   agent any
   
    
   environment {
      AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
      AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }
  
  stages {
      stage('checkout') {
         steps {
             script {

                     git "https://github.com/alokaryan/testterraform.git"
                 }
             }
         }

      
      stage('plan') {
         steps {
            script {
                   sh 'terraform init -input=false'
                   sh "terraform plan -input=false -out tfplan"
                   sh "terraform show tfplan > tfplan.txt"
            }
         }
      }
     
     
    
    stage('apply') {
            
        steps {
           script {
                 sh "terraform apply -input=false tfplan"
            }
        }
    }
}
