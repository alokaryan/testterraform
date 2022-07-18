pipeline {
   agent any
   
   parameters {
      string(name: 'environment', defaultValue: 'terraform', description: 'workplace to use')
      booleanParam(name: 'autoApprove', defaultValue: false, description: 'auto run or not')
      booleanParam(name: 'destroy', defaultValue: false, description: 'destroy everything')
   }
   
   environment {
      AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
      AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }
  
  stages {
      stage('checkout') {
         steps {
             script {
                 dir("terraform")
                 {
                     git "https://github.com/alokaryan/testterraform.git"
                 }
             }
         }
      }
      
      stage('plan') {
         steps {
            sh 'terraform init -input=false'
            sh "terraform plan -input=false -out tfplan"
            sh "terraform show tfplan > tfplan.txt
         }
     }
     
     stage('approve') {
         when {
            not {
                equal expected: true, actual: params.autoApprove
            }
            not {
                equals expected: true. actual: params.destroy
            }
         }
         
         steps {
             script {
                def plan = readfile 'tfplan.txt'
                input message = "Do you really want to apply?"
                parameters: [text(name: 'Plan', description: 'check again', defaultValue: plan)]
             }
        }
    }
    
    stage('apply') {
        when {
           not {
              equals expected: true, actual: param.destroy
           }
        }
        
        steps {
            sh "terraform apply -input=false tfplan"
            }
   }
   
   stage('destroy') {
       when {
          equals expected: true, actual: params.destroy
       }
       steps {
          sh "terraform destroy --auto-approve"
          }
   }
  
  }
}
