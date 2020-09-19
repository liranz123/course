pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    stages {
        stage('SonarQube analysis') {
          def scannerHome = tool 'SonarScanner 4.0';
          withSonarQubeEnv('My SonarQube Server') { 
            sh "${scannerHome}/bin/sonar-scanner"
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

