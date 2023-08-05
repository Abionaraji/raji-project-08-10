pipeline{
    agent any
    tools{
        jdk 'JDK'
        maven 'Maven'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git branch: 'cp-rem', url: 'https://github.com/Abionaraji/project-one.git'
            }
        }
    }
}