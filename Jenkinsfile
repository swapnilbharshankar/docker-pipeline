node('docker'){
    stage 'Checkout'
        checkout scm
    stage 'Build Dockerfile'
    sh "docker build -t swapnil_test:${BUILD_NUMBER} -f Dockerfile ."
}