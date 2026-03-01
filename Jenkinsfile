pipeline {
    agent any

    stages {

stage('Compilar proyecto WAR') {
    steps {
        sh '''
        docker run --rm \
          -v $WORKSPACE:/app \
          -w /app \
          maven:3.9.6-eclipse-temurin-17 \
          mvn clean package -DskipTests
        '''
    }
}

        stage('Construir imagen Docker') {
            steps {
                sh 'docker build -t imagen_vehiculos .'
            }
        }

        stage('Desplegar contenedor') {
            steps {
                sh 'docker stop contenedor_sucursal || true'
                sh 'docker rm contenedor_sucursal || true'
                sh 'docker run -d -p 9090:8080 --name contenedor_sucursal imagen_vehiculos'
            }
        }
    }
}
