stages {

stage(‘Checkout’) {

steps {

checkout([$class: ‘GitSCM’, branches: [[name: ‘*/main’]], extensions: [], userRemoteConfigs: [[url: ‘https://github.com/alokaryan/testterraform.git‘]]])

}

}

stage (“terraform init”) {

steps {

sh (‘terraform init’)

}

}

stage (“terraform Action”) {

steps {

echo “Terraform action is –> ${action}”

sh (‘terraform ${action} –auto-approve’)

}

}

}

}
