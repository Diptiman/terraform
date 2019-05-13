pipeline {
    agent { docker { image 'node:6.3' } }
    stages {
        stage('build') {
            steps {
                git 'https://github.com/jglick/simple-maven-project-with-tests.git'
            }
        }
    }
}