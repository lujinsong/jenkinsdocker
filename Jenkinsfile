node{
    def app
    stage('Clone Repository'){
        /* let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
    stage('Build image'){
        /* Build docker image, similar to docker build on the command line */
        app = docker.build("lujasper/devops:jenkinsdocker")
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
        /*Using docker with pipeline https://jenkins.io/doc/book/pipeline/docker/*/
        docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
            /*app.push("${env.BUILD_NUMBER}")
            app.push("latest")
                add this image to lujasper/devops repository, tag it as jenkinsdocker
            */
            app.push("jenkinsdocker")
        }
    }
}