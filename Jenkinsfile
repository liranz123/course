pipeline {
    agent any
    tools { 
        maven 'maven'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }
        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube server') {
                    // -X for running in debug mode
                        sh 'mvn clean install -X sonar:sonar'
                    }
            }
        }
        stage('Build'){
            steps{
                sh 'mvn -B -DskipTests clean package'
            } 
        }
        stage('Docker Image Build') {
            steps {
               sh 'docker build -t automatit/app:latest .'
            }
        }
        stage('push to nexus'){
            steps{
                docker.withRegistry('http://10.244.1.75:8081', 'nexus') {
                          customImage.push()
                }
            }  
        }
    }    
}





