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
                sh 'mvn clean install'
            }
        }
               stage('SonarQube analysis') {
                        steps {
                            script {
                                // Set Sonarqube login and password
                                def sonarToken = 'squ_0af291f67522c3a856788c1b7ff5606d6da75ea2'

                                // Run Sonarqube analysis
                                sh "mvn sonar:sonar -Dsonar.login=${sonarToken} "
                            }
                        }
                    }
                }
            }