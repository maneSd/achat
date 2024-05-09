pipeline {
    agent any

    stages {
     stage('Print Workspace Location') {
                steps {
                    script {
                        // Print the current workspace location
                        sh 'pwd'
                    }
                }
            }
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
                    sh "mvn sonar:sonar -Dsonar.login=${sonarToken}"
                }
            }
        }
        stage('Nexus') {
            steps {
                script {
                    sh 'mvn deploy -Dmaven.test.skip=true'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t manelsaidani27/achat:1.0.0 .'
            }
        }
        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin"
                        sh "docker push manelsaidani27/achat:1.0.0"
                    }
                }
            }
        }
        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        success {
            emailext (
                to: 'msaidani86@gmail.com',
                subject: 'Pipeline Jenkins construit avec succès',
                body: 'Votre pipeline Jenkins a été construit avec succès.'
            )
        }
    }
}
