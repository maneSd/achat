pipeline {
    agent any
    stages {
        stage ('Hello'){
            steps {
                echo 'Hello touta Im here';
                git branch: 'takwa',
                url: 'https://github.com/maneSd/achat';
            }
        }
         stage('Git') {
               steps {
                    git branch: 'takwa',
                    url: 'https://github.com/maneSd/achat.git'
                    }
                }
         stage('Maven build') {
                steps {
                    sh 'mvn clean compile'
                    }
                }
         stage('sonarQube') {
                steps {
                    echo 'loading ...'
                       }
                }
    }
}