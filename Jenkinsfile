pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Git') {
            steps {
                git branch: 'takwa',
                url: 'https://github.com/maneSd/achat.git',
            }
        }
        stage('Maven version') {
            steps {
                sh 'mvn -version'
            }
        }
    }
}