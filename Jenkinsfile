pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Verify Python Files') {
            steps {
                script {
                    sh 'ls -la *.py || echo "No Python files found."'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script { 
                    dockerImage = docker.build('your-docker-image-name:latest')
                }
            }
        }

        stage('Debug Environment2') {
            steps {
                script {
                    dockerImage.inside {
                        // List installed Python packages
                        sh 'pip list'
                        // Verify the presence of pylint
                        //sh 'which pylint || echo pylint not found'
                        // Check the version of pylint
                        //sh 'pylint --version || echo pylint version command failed'
                        // Check for write permission in /tmp (optional)
                        sh 'touch /tmp/test_permission && echo "Write permission in /tmp OK" || echo "No write permission in /tmp"'
                    }
                }
            }
        }

        stage('Lint Code with Pylama') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'pylama'
                        sh 'pylama -v'
                    }
                }
            }
        }
 
    }
}
