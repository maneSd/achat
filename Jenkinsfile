pipeline {
    agent any

    stages {
        stage('Git') {
            steps {
                git branch: 'Manel_Branch', url: 'https://github.com/maneSd/achat.git'
            }
        }
        stage('Maven') {
            steps {
                sh 'mvn clean compile'
            }
        }
         stage('SonarQube') {
                    steps {
                    sh 'mvn sonar:sonar'
                    }
                }
    }
}
