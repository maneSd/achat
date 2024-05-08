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
                    // Set Nexus credentials
                    def nexusUsername = 'admin'
                    def nexusPassword = 'admin'
                    def nexusUrl = 'http://192.168.50.4:8081/repository/maven-releases/'

                    // Read pom.xml file and extract groupId
                    def pomXml = readFile('pom.xml')
                    def groupId = new XmlSlurper().parseText(pomXml).groupId.text()

                    // Define artifact details
                    def artifactId = 'achat'
                    def version = '1.0'
                    def artifactPath = "${env.WORKSPACE}/target/achat-${version}.jar"

                    // Deploy artifact to Nexus
                    sh "mvn deploy:deploy-file -Durl=${nexusUrl} -DrepositoryId=nexus -Dfile=${artifactPath} -DgroupId=${groupId} -DartifactId=${artifactId} -Dversion=${version} -Dpackaging=jar -DgeneratePom=true -DrepositoryUsername=${nexusUsername} -DrepositoryPassword=${nexusPassword}"
                }
            }
        }
    }
}
