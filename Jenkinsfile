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


        stage('Lint Code7') {
            steps {
                script {
                    dockerImage.inside {
                        // Specify absolute path for the cache directory
                        sh 'pylint --rcfile=/app/.pylintrc **/*.py'
                        //def cacheDir = "/tmp/.pylint_cache"

                        // Run pylint with the cache directory
                        //sh "pylint --init-hook='import os; os.makedirs(\"${cacheDir}\", exist_ok=True)' --rcfile=/app/.pylintrc **/*.py || exit 1"
                    }
                }
            }
        }

        stage('Lint Code6') {
            steps {
                script {
                    dockerImage.inside {
                        // Use the PyLint command with the custom rcfile
                        sh 'mkdir -p /tmp/.pylint_cache'
                        sh '''
                        find . -name "*.py" | xargs pylint --init-hook="import os; os.makedirs('/tmp/.pylint_cache', exist_ok=True)" \
                               --rcfile=/app/.pylintrc || exit 1
                        '''
                    }
                }
            }
        }


        stage('Lint Code5') {
            steps {
                script {
                    dockerImage.inside {
                        // Use the PyLint command with the custom rcfile
                        sh '''
                        pylint --init-hook="import os; os.makedirs('/tmp/.pylint_cache', exist_ok=True)" \
                               --rcfile=/app/.pylintrc **/*.py || exit 1
                        '''

                    }
                }
            }
        }

        stage('Lint Code') {
            steps {
                script {
                    dockerImage.inside {
                        //sh 'mkdir -p /tmp/.pylint_cache'
                        def cacheDir = "/tmp/.pylint_cache"
                        //sh 'pylint --init-hook="import os; os.makedirs(\'/tmp/.pylint_cache\', exist_ok=True)" --rcfile=/app/.pylintrc **/*.py || exit 1'
                        //sh 'pylint --init-hook="import os; os.makedirs(\'/tmp/.pylint_cache\', exist_ok=True)" --rcfile=/app/.pylintrc **/*.py || exit 1'
                        sh "pylint --init-hook='import os; os.makedirs(\"${cacheDir}\", exist_ok=True)' --rcfile=/app/.pylintrc **/*.py || exit 1"

                    }
                }
            }
        }

        stage('Lint Code4') {
            steps {
                script {
                    dockerImage.inside {
                        // Correctly use the PyLint command with the custom rcfile and init-hook
                        // This command does everything in one go: creates cache directory and runs pylint

                        //sh '''
                        //pylint --init-hook="import os; os.makedirs('/tmp/.pylint_cache', exist_ok=True)" \
                               //--rcfile=/app/.pylintrc **/*.py || exit 1
                        //'''
                       // sh '''
                       // pylint --init-hook="import os; os.makedirs('/tmp/.pylint_cache', exist_ok=True)" \
                             //  --rcfile=/app/.pylintrc **/*.py || exit 1
                       // '''

                        sh 'pylint --init-hook="import os; os.makedirs(\'/tmp/.pylint_cache\', exist_ok=True)" --rcfile=/app/.pylintrc **/*.py || exit 1'



                        // Additional debugging step: list the contents of the pylint cache directory
                        sh 'ls -la /tmp/.pylint_cache || echo "Cache directory not found"'
                    }
                }
            }
        }
    }
}
