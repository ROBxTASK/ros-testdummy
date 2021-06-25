node('robxtask-jenkins-slave') {

    // -----------------------------------------------
    // --------------- Staging Branch ----------------
    // -----------------------------------------------
  
    if (env.BRANCH_NAME == 'staging') {

        stage('Clone and Update') {
            git(url: 'https://github.com/ROBxTASK/ros-testdummy.git', branch: env.BRANCH_NAME)
        }
      

        stage('Build Application - staging') {
            // FIXME: build catkin workspace??
            // sh 'mvn clean install -Denv=staging'
        }

        stage('Build Docker - staging') {
            sh './docker-build.sh'
        }

        stage('Push Docker - staging') {
            sh 'docker push robxtask/ros-testdummy:staging'
        }

        stage('Deploy - staging') {
            // FIXME: deploy container
            // sh 'ssh staging "cd /srv/docker-setup/staging/ && ./run-staging.sh restart-single ros-testdummy"'
        }
    }

    // -----------------------------------------------
    // ---------------- Master Branch ----------------
    // -----------------------------------------------
    if (env.BRANCH_NAME == 'master') {

        stage('Clone and Update') {
            git(url: 'https://github.com/ROBxTASK/ros-testdummy.git', branch: env.BRANCH_NAME)
        }

        stage('Build Application') {
            // FIXME: build catkin workspace??
            // sh 'mvn clean install -Denv=prod'
        }
    }

    // -----------------------------------------------
    // ---------------- Release Tags -----------------
    // -----------------------------------------------
    if( env.TAG_NAME ==~ /^\d+.\d+.\d+$/) {

        stage('Clone and Update') {
            git(url: 'https://github.com/ROBxTASK/ros-testdummy.git', branch: 'master')
        }

        stage('Set version') {
            // FIXME: is this required??
            sh 'mvn versions:set -DnewVersion=' + env.TAG_NAME
        }

        stage('Build Application - ' + env.TAG_NAME) {
            // FIXME: build catkin workspace??
            sh 'mvn clean install -Denv=prod'
        }

        stage('Build Docker - ' + env.TAG_NAME) {
            sh './docker-build.sh'
        }

        stage('Push Docker - ' + env.TAG_NAME) {
            sh 'docker push robxtask/ros-testdummy:latest'
            sh 'docker tag robxtask/ros-testdummy:latest robxtask/ros-testdummy:' + env.TAG_NAME
            sh 'docker push robxtask/ros-testdummy:' + env.TAG_NAME
        }

        stage('Deploy - ' + env.TAG_NAME) {
            // FIXME: sh 'ssh robxtask "cd /data/deployment_setup/prod/ && export COMPOSE_HTTP_TIMEOUT=600 && sudo ./run-prod.sh restart-single ros-testdummy"'
        }

    }
}
