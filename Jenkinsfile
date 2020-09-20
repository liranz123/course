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
        // stage('build && SonarQube analysis') {
        //     steps {
        //         withSonarQubeEnv('sonarqube server') {
        //             // -X for running in debug mode
        //                 sh 'mvn clean install -X sonar:sonar'
        //             }
        //     }
        // }
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
    }
}