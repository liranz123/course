pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
            args '-v /var/jenkins_home/sonar-scanner/sonar-scanner-3.3.0.1492-linux:/bin/sonar-scanner'
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
