pipeline {
    agent any
    environment {
        DOCKERHUB_COMMON_CREDS = credentials('dockerhub')
    }
    stages {
        stage('Initialize Stage') {
            steps {
            
                echo 'Initial : Delete  containers and images'
                 dir('Lab_jenkins_dockercompose') { // change directory to Lab_docker_Jenkins
                    echo "Current path is ${pwd()}"
                    sh "docker-compose down --rmi all --volumes || true"
                }
            }
        }

        // stage('Build Stage') {
        //     steps {
        //         dir('Lab_jenkins_dockercompose') { // change directory to Lab_docker_Jenkins
        //             echo "Current path is ${pwd()}"
        //             sh "docker-compose build"
        //         }
        //     }
        // }

        stage('Compose Stage') {
            steps {
                dir('Lab_jenkins_dockercompose') { // change directory to Lab_docker_Jenkins
                    sh "docker login -u ${DOCKERHUB_COMMON_CREDS_USR} -p ${DOCKERHUB_COMMON_CREDS_PSW}"
                    sh "docker-compose up -d"
                }
            }
        }

        stage('Push to Dockerhub Stage') {
            steps {
                dir('Lab_jenkins_dockercompose') { // change directory to Lab_docker_Jenkins
                    echo "Current path is ${pwd()}"
                    echo "Pushing images to dockerhub"
                    sh "docker-compose push"
                }
            }
        }

    }
}
