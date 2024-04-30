pipeline {
    agent any

    stages {
        stage('Git') {
            steps {
                git branch: 'takwa', url: 'https://github.com/maneSd/achat.git'
            }
        }
        stage('Maven') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Artifact') {
            steps {
                 sh 'mvn install'
            }
        }
        stage('sonarqube') {
             steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'mvn sonar:sonar'
                    }
                }
             }
    }
}