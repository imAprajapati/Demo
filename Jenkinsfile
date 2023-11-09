pipeline{
    agent any
    stages{
        stage("Code Cloning"){
            steps{
                echo "Code Cloning"
                git url:"https://github.com/imAprajapati/Demo.git",branch:"master"
            }
        }
        stage("Build"){
            steps{
                echo "Building the image"
                sh "docker build -t python-app:latest ."
            }
        }
        stage("Push to docker hub"){
            steps{
                echo "Pushing the code to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerPass",usernameVariable:"dockerUser")]){
                    sh "docker tag python-app ${env.dockerUser}/python-app:latest"
                    sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                    sh "docker push ${env.dockerUser}/python-app:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "Deployin the docker Container"
                sh "docker-compose down && docker-compose up -d"
                sh "docker image prune -f"
            }
        }
    }
}