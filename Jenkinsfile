node('docker'){
    stage 'Checkout'
        checkout scm
    stage 'Build Dockerfile'
        sh "docker build -t swapnil_test:${BUILD_NUMBER} -f Dockerfile ."
    stage 'Create Container'
        containerID = sh (
            script: "docker run -d -p 80:80 swapnil_test:${BUILD_NUMBER}"
            returnStdout: true
        )
        echo "Container ID is ===>  $containerID" 
}