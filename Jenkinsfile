pipeline{
    agent{label 'master'}
    tools{
        maven 'M3'
    }
    stages{
        stage('Checkout'){
            steps{
                git 'https://github.com/Phavithran/DigitalBank.git'
            }
        }
        stage('Build'){
            steps{
                 sh 'mvn clean compile'
            }
        }
        stage('Test'){
            steps{
                     sh 'mvn clean test'
                     junit '**/target/surefire-reports/TEST-*.xml'
            }
        }
        stage('Package'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Deploy'){
            steps{
                input 'Do you approve the deployment?'
                sh 'scp target/*.jar deploy@65.0.27.76:/home/deploy'
                sh "ssh deploy@65.0.27.76 'nohup java -jar /home/deploy/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar &'"
            }
        }
    }
}

