node ('slave') {
    
    def application='icici-lombard'
    def dockerhubaccountid = 'tridevg'
    
    stage('clone repo') {
        git 'https://github.com/adsnjhfyeqw231eas/star-agile-insurance-project.git'
    }
    stage('maven test') {
        sh 'mvn test'
    }
    stage('maven build') {
        sh 'mvn install'
    }
    stage('build image') {
        app=docker.build("${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
    }
    stage('Push Image') {
      withDockerRegistry([credentialsId: 'dockercred', url:'']) {
        app.push()
        app.push('latest')
      }
    }
    stage('Run Container') {
        sh ("docker run --rm -d -p 80:8081 -v /var/log/app:/var/log/app --name ${application}-${BUILD_NUMBER} ${dockerhubaccountid}/${application}:${BUILD_NUMBER}")
    }
    stage('verify running containers') {
        sh 'docker ps'
    }
    stage('Remove unused images') {
      sh("docker rmi ${dockerhubaccountid}/${application}:latest -f")
    }
    
}
