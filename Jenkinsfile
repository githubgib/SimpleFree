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
                    sh 'ls -la *.py'
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
                        sh 'pip list' // List installed Python packages
                        sh 'which pylint || echo pylint not found'
                        sh 'pylint --version || echo pylint version command failed'
                    }
                }
            }
        }

        // Combined linting stage
        stage('Lint Code4') {
            steps {
                script {
                    dockerImage.inside {
                        // Use the PyLint command with the custom rcfile
                        sh 'pylint --init-hook="import os; os.makedirs(\'/tmp/.pylint_cache\', exist_ok=True)" --rcfile=/app/.pylintrc **/*.py'
                        sh 'pylint --rcfile=/app/.pylintrc **/*.py || exit 1'
                    }
                }
            }
        }
  
        stage('Lint Code3') {
            steps {
                script {
                    dockerImage.inside {
                        sh '/usr/local/bin/pylint **/*.py || exit 1'
                    }
                }
            }
        }

        stage('Debug Environment') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'pip list' // List installed Python packages
                        sh 'which pylint || echo pylint not found'
                        sh 'pylint --version || echo pylint version command failed'
                    }
                }
            }
        }


        stage('Lint Code') {
            steps {
                script {
                    dockerImage.inside {
                        // Run PyLint command within the Docker container
                        sh 'pylint **/*.py || exit 1'
                        sh 'pylint --version'
                        sh 'ls -la'
                    }
                }
            }
        }

        // If you need a separate stage for any reason
        stage('Lint Code2') {
            steps {
                script {
                    dockerImage.inside {
                        sh '/usr/local/bin/pylint **/*.py'
                        sh 'pylint --version'
                        sh 'ls -la'
                        // If you need to run PyLint on specific files
                        // sh '/usr/local/bin/pylint specific_file.py'
                     }
              }
            }
        }

    }
}
