pipeline{
    agent any
    tools{
        maven 'Maven'
        jdk 'JDK'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'ci-jenkins', url: 'https://github.com/Abionaraji/raji-project-08-10.git'
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn clean install'
            }
            post {
                success{
                    echo 'New achiving'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage('Unit Test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Checkstyle Analysis'){
            steps{
                sh 'mvn checkstyle:checkstyle'
            }
        }
        stage('Integrated Testing'){
            steps{
                sh 'mvn verify -DiskipUnitTests'
            }
        }
        stage('Sonar Scanner'){
            steps{
                withSonarQubeEnv(credentialsId: 'sonar-jenkins', installationName: 'sonarqube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
        stage('Quality Gate'){
            steps{
                waitForQualityGate abortPipeline: false, credentialsId: 'sonar-jenkins'
            }
        }
        stage('War Upload'){
            steps{
                nexusArtifactUploader artifacts: 
                [
                    [
                        artifactId: 'vprofile', 
                        classifier: '', 
                        file: 'target/vprofile-v2.war', 
                        type: 'war'
                        ]
                    ], 
                    credentialsId: 'nexus-jenkins', 
                    groupId: 'com.visualpathit', 
                    nexusUrl: '18.212.37.145:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'vpro-maven', 
                    version: 'v2'
            }
        }
    }
}