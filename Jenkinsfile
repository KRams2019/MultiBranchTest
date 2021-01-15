node {
// Get Artifactory server instance, defined in the Artifactory Plugin administration page.
    def server = Artifactory.server "artifactory-server-id"
    def buildInfo = Artifactory.newBuildInfo() 

// Project Dir
    def project_path = "Download"
dir(project_path){

stage('Build Managment') {
      def downloadSpec = """{
	 "files": [
	{
	"pattern": "petclinic-war/*.war",
	"target": "files/"
        }
	]
	}"""
	server.download spec: downloadSpec
 }

stage('Deployment - Stage'){
  deploy adapters: [tomcat8(credentialsId: 'deployer-tomcat', path: '', url: 'http://rlzvt92632dns.eastus2.cloudapp.azure.com:8080/')], contextPath: 'petclinic', war: 'files/petclinic.war'
    }
  }
}
