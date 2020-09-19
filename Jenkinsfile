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
	        	sh "docker build . -t phavi85/digibank"
        		sh "docker run -d -p 8081:8080 phavi85/digibank"
            }
        }
    }
}

