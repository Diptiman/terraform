pipeline {
    agent {
      label any
    }
    stages {
        stage('build') {
            steps {
                git url: gitRepo, branch: 'jenkins'
            }
        }
    }
}