//Job == docker_demo_pipeline
node() {
      stage('Checkout') {
          checkout scm
      }
      stage('Build') {
        sh """
          ./build/build.sh
        """
      }
      stage('Push') {
          sh """
            ./push/push.sh
          """
      }
      stage('Deploy') {
          sh """
            ./deploy/deploy.sh
          """
      }

  }