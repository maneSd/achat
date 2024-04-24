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
                     withCredentials([string(credentialsId: 'Wevioo@2023++', variable: 'SONAR_PASSWORD')]) {
                         sh 'mvn sonar:sonar -Dsonar.host.url=http://192.168.50.4:9000 -Dsonar.login=$SONAR_PASSWORD'
                     }
                 }
    }
}
