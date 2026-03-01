pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Esto asegura que baje la última versión de tu código de GitHub
                checkout scm
            }
        }

        stage('Compilar proyecto WAR') {
            steps {
                sh '''
                chmod +x mvnw
                ./mvnw clean package -DskipTests
                '''
            }
        }

        stage('Construir imagen Docker') {
            steps {
                // Usamos el tag que definiste
                sh 'docker build -t imagen_vehiculos .'
            }
        }

        stage('Desplegar contenedor') {
            steps {
                script {
                    // Detenemos y borramos si ya existe para que no de error de "nombre ocupado"
                    sh 'docker stop contenedor_sucursal || true'
                    sh 'docker rm contenedor_sucursal || true'
                    // Desplegamos en el puerto 9090 como pide la actividad
                    sh 'docker run -d -p 9090:8080 --name contenedor_sucursal imagen_vehiculos'
                }
            }
        }
    }
    
    post {
        success {
            echo '¡El despliegue fue exitoso! Accede en http://<TU-IP-EC2>:9090'
        }
        failure {
            echo 'Algo falló en el pipeline. Revisa los logs de la etapa anterior.'
        }
    }
}
