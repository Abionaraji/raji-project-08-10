pipeline{
    aagent any
    tool{
        jdk 'JDK'
        maven 'Maven'
    }
    stages{
        stege('Git Checkout'){
            steps{
                git branch: 'cp-rem', url: 'https://github.com/Abionaraji/project-one.git'
            }
        }
    }
}