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
        stage('Reports'){
            steps{
                sh 'mvn verify'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site/jacoco', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])     
                }
        }   
        stage('Deploy'){
            steps{
                input 'Do you approve the deployment?'
                sh 'scp target/*.jar deploy@66.42.57.66:/home/deploy'
                sh "ssh deploy@66.42.57.66 'nohup java -jar /home/deploy/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar &'"
            }
        }
    }
}
