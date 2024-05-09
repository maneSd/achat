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
    stage('Configure Prometheus and Grafana') {
               steps {
                   script {
                       def prometheusConfig = '''
                       - job_name: your_spring_boot_app
                         metrics_path: /prometheus
                         static_configs:
                         - targets: ['http://192.168.50.4/:8082']
                       '''

                       sh "echo '${prometheusConfig}' | sudo tee -a /etc/prometheus/prometheus.yml"
                       // Assuming you need sudo permissions to write to the Prometheus config file

                       // Add Grafana service to docker-compose.yml
                       sh 'echo "  grafana:\n    image: grafana/grafana:latest\n    ports:\n      - "3000:3000"\n    depends_on:\n      - prometheus" >> docker-compose.yml'
                   }
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
