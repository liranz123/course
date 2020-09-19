pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
    
    stages {
        stage('sonarqube test') {
            steps {
                script {
                def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv("sonarqube-container") {
                    sh "${tool("sonarqube")}/bin/sonar-scanner \
                    -Dsonar.projectKey=test-node-js \
                    -Dsonar.sources=. \
                    -Dsonar.css.node=. \
                    -Dsonar.host.url=http://your-ip-here:9000 \
                    -Dsonar.login=your-generated-token-from-sonarqube-container"
                     }
                }
            }
        }
        stage('Build') { 
            steps {
                withSonarQubeEnv('My SonarQube Server')
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
