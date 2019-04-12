node{
    def app
    stage('Clone Repository'){
        /* let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
    stage('Build image'){
        /* Build docker image, similar to docker build on the command line */
        app = docker.build("jenkinsdocker")
    }
    stage('Test image')
    {
        /* put npm test command here once configured test */
        app.inside{
            sh 'echo "Tests passed"'
        }
    }
    stage('Push image')
    {
        docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}