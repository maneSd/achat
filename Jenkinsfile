pipeline {
    agent any

    stages {
        stage('Git') {
            steps {
                git branch: 'Manel_Branch', url: 'https://github.com/maneSd/achat.git'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                script {
                    // Set Sonarqube login and password
                    def sonarToken = 'squ_0af291f67522c3a856788c1b7ff5606d6da75ea2'

                    // Run Sonarqube analysis
                    sh "mvn sonar:sonar -Dsonar.login=${sonarToken}"
                }
            }
        }
        stage('Nexus Deployment') {
            steps {
                script {
                    def nexusUsername = 'admin '
                    def nexusPassword = 'admin'
                    def nexusUrl = 'http://http://192.168.50.4:8081/repository/maven-releases/'

                    sh "mvn deploy:deploy-file -Durl=${nexusUrl} -DrepositoryId=nexus -Dfile=path/to/your/artifact.jar -DgroupId=your.group.id -DartifactId=artifact-id -Dversion=version -Dpackaging=jar -DgeneratePom=true -DrepositoryId=nexus -DrepositoryUsername=${nexusUsername} -DrepositoryPassword=${nexusPassword}"
                }
            }
        }
    }
}
