pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
    stages {
        stage('Checkout'){
            steps{
                script{
                    sshagent(credentials:['596a712d-96c7-4a89-ac35-845f983b89df']){
                        git 'git@github.com:yejiemin0321/simple-node-js-react-npm-app.git'
                    }
                }
            }
        }
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
    }
}