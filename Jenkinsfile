pipeline {
    agent any
    tools {
        maven "maven"
    }

    stages {
        
        stage('Clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Mahesh363/Sample_Blob.git'
            }
            
        }
        
        stage('Build') {
            steps {

                // Run Maven on a Unix agent.
               //  sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                   bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

//             post {
//                 // If Maven was able to run the tests, even if some of the test
//                 // failed, record the test results and archive the jar file.
//                 success {
//                     junit '**/target/surefire-reports/TEST-*.xml'
//                     archiveArtifacts 'target/*.jar'
//                 }
//             }
        }
        
        stage('shell script') {
            steps {
                echo 'build succeeded'
            }
        }
        
        stage('docker package') {
            steps {
                bat 'docker build -t dockerjava .'
            }
        }
        
//         stage('docker login') {
//             steps {
//                 	bat 'docker login -u gopiteekenam -p 48cc7b0c-36c1-4ee8-b762-053f950813b0'
//             }
//         }
        
//         stage('docker push') {
//             steps {
//                 sh 'docker push dockerjava:latest'
//             }
//         }
        
//        stage('docker deploy') {
//            steps {
//                bat 'docker run -p 9090:8080 dockerjava'
//            }
//        }
              stage('deploy to k8s') {
            steps {
                bat 'kubectl apply -f nginx-deployment-service.yml'
            }
        }
		
	       stage('run app') {
            steps {
                bat 'minikube service nginx'
            }
        }
                
    }
}
