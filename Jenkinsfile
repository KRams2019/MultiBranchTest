node {

notify('Started')

try {

// Get Artifactory server instance, defined in the Artifactory Plugin administration page.
    def server = Artifactory.server "artifactory-server-id"
    def buildInfo = Artifactory.newBuildInfo() 


stage('GitCheckOut') {
git branch: 'ansible-deploy', credentialsId: '01', url: 'https://github.com/KRams2019/MultiBranchTest.git'
}




stage('Build Managment') {
      def downloadSpec = """{
	 "files": [
	{
	"pattern": "petclinic-war/*.war",
	"target": "roles/petclinic/files/"
        }
	]
	}"""
	server.download spec: downloadSpec
 }


stage('Getting Ready for Ansible Deploy'){
   sh "echo \'<h1> TASK BUILD ID: ${env.BUILD_DISPLAY_NAME}</h1>\'  > roles/petclinic/files/jenkins.html"
  }

stage('Deployment - Production'){
   sh 'ansible-playbook petclinic.yaml'
  }

  notify('Completed')
} catch(err){
  notify("Error ${err}")
  currentBuild.result = 'FAILURE'
 }
}
def notify(status){
	
}
