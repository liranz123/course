pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    
    stages {
        stage('Build') { 
            steps {
                withSonarQubeEnv('sonarqube server')
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
