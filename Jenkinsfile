pipeline {
    agent any

    environment {
        registry = "10.108.48.161:5003/docker"
        registryCredential = 'nexus'
        dockerImage = ''
    }
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
        // stage('build && SonarQube analysis') {
        //     steps {
        //         withSonarQubeEnv('sonarqube server') {
        //             // -X for running in debug mode
        //                 sh 'mvn clean install -X sonar:sonar'
        //             }
        //     }
        //}
        // stage('Build'){
        //     steps{
        //         sh 'mvn -B -DskipTests clean package'
        //     } 
        // }

        stage('Build'){
            steps{
                sh 'mvn clean install'
            } 
        }

        // stage('Docker Image Build') {
        //     steps {
        //        sh 'docker build -t automatit/app:latest .'
        //     }
        // }
        stage('Building image') {
            steps{
              script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
              }
            }
        }

        stage('Deploy Image') {
            steps{
              script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
                }
              }
            }
        }
        // stage('push to nexus'){
        //     steps{
        //         docker.withRegistry('http://', 'nexus') {
        //                   customImage.push()
        //         }
        //     }  
        // }
    }    
}





