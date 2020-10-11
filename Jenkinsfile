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
		archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        stage('Deploy'){
            steps{
                input 'Do you approve the deployment?'
		sh 'scp /var/lib/jenkins/workspace/Digibank/target/*.war ubuntu@15.206.153.16:/home/ubuntu'
		sh 'scp /var/lib/jenkins/workspace/Digibank/Dockerfile ubuntu@15.206.153.16:/home/ubuntu'
		sh "ssh ubuntu@15.206.153.16 'docker build /home/ubuntu -t phavi85/digibank'"
		sh "ssh ubuntu@15.206.153.16 'docker run -d -p 8084:8080 phavi85/digibank'"
//*    
//	        	sh "docker build . -t digibank"
//        		sh "docker run -d --name MyDigibank -p 8083:8080 phavi85/digibank"
            }
        }
    }
}
