pipeline {
    agent any

    stages {
        stage('Git-check') {
            steps {
                git branch: 'takwa', url: 'https://github.com/maneSd/achat.git'
            }
        }
        stage('Maven-check') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Artifact') {
            steps {
                 sh 'mvn install'
            }
        }
        stage('sonarqube-check') {
             steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'mvn sonar:sonar'
                    }
                }
             }
    }
}