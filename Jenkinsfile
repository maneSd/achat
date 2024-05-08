pipeline {
    agent any

    environment {
        MAVEN_HOME = tool 'Maven'
    }

    stages {
        stage('Git') {
            steps {
                git branch: 'Manel_Branch', url: 'https://github.com/maneSd/achat.git'
            }
        }
        stage('Maven Build') {
            steps {
                sh "${MAVEN_HOME}/bin/mvn clean install"
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    // Set Sonarqube login and password
                    def sonarToken = 'squ_0af291f67522c3a856788c1b7ff5606d6da75ea2'

                    // Run Sonarqube analysis
                    sh "${MAVEN_HOME}/bin/mvn sonar:sonar -Dsonar.login=${sonarToken}"
                }
            }
        }
        stage('Nexus Deployment') {
            steps {
                script {
                    def nexusUsername = 'your_nexus_username'
                    def nexusPassword = 'your_nexus_password'
                    def nexusUrl = 'http://your_nexus_url/repository/maven-releases/'
                    def groupId = 'tn.esprit.rh'
                    def artifactId = 'achat'
                    def version = '1.0'
                    def artifactPath = "${env.WORKSPACE}/target/achat-${version}.jar"

                    sh "${MAVEN_HOME}/bin/mvn deploy:deploy-file -Durl=${nexusUrl} -DrepositoryId=nexus -Dfile=${artifactPath} -DgroupId=${groupId} -DartifactId=${artifactId} -Dversion=${version} -Dpackaging=jar -DgeneratePom=true -DrepositoryUsername=${nexusUsername} -DrepositoryPassword=${nexusPassword}"
                }
            }
        }
    }
}
