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
                    // Optionally use a Maven environment you've configured already
                        sh 'mvn clean package sonar:sonar'
                    }
            }
        }  
        stage ('Build') {
            steps {
                echo 'This is a minimal pipeline.'
            }
        }
    }
}