pipeline {
    agent any
    stages {
        stage('Git') {
            steps {
                echo 'Hello touta Im here'
                git branch: 'takwa', url: 'https://github.com/maneSd/achat.git'
            }
        }
        stage('Maven build') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('Install artifact') {
            steps {
                sh 'mvn install'
            }
        }
        stage('SonarQube') {
            steps {
                echo 'Performing SonarQube analysis...'
            }
        }
    }
}
