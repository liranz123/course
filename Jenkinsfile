pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('Code Quality Check via SonarQube') {
           steps {
             script {
                def scannerHome = tool 'sonarqube';
                withSonarQubeEnv("sonarqube-container") {
                sh "${tool("sonarqube")}/bin/sonar-scanner \
                -Dsonar.projectKey=test-node-js \
                -Dsonar.sources=. \
                -Dsonar.css.node=. \
                -Dsonar.host.url=http://10.244.1.45:9000 \
                -Dsonar.login=e759ad2357ddd3690df57ebe088196bdccba6915"
                }
             }
           }
        }
        stage('Build') { 
            steps {
                sh 'mvn clean package sonar:sonar' 
            }
        }
    }
    post {
        always {
            sh 'echo "clean workspace"'
            cleanWs()
        }
    }
}

