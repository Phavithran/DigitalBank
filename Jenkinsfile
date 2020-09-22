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
//		sh 'scp /var/lib/jenkins/workspace/DigitalBank/target/*.jar produser@15.207.99.183:/home/produser'
//		sh 'scp /var/lib/jenkins/workspace/DigitalBank/Dockerfile produser@15.207.99.183:/home/produser'
//		sh "ssh produser@15.207.99.183 'docker build /home/produser -t phavi85/digibank'"
//		sh "ssh produser@15.207.99.183 'docker run -d -p 8081:8080 phavi85/digibank'"
	        	sh "sudo docker build . -t phavi85/digibank"
        		sh "sudo docker run -d -p 8082:8080 phavi85/digibank"
//		        sh "sudo docker push phavi85/digibank"
            }
        }
    }
}
