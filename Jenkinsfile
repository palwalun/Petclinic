pipeline{
 agent any
 
  environment {
        SCANNER_HOME=tool 'SonarScanner'
    }
	
   stages{
    stage('Checkout'){
	 steps{
	  git branch: 'main', url:'https://github.com/palwalun/Petclinic.git'
	  }
	 }
	 stage('Build'){
	 steps{
	  sh 'mvn clean package'
	  }
	 }
     stage('Test'){
	 steps{
	  sh 'mvn test'
	  }
	 }
	 stage('SonarQube Analysis'){
	 steps{
	  sh 'mvn test'
	  }
	 }
	 stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('SonarQube') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Petclinic \
                    -Dsonar.java.binaries=. \
                    -Dsonar.projectKey=Petclinic '''
    
                }
            }
        }
		stage('Quality-Gate'){
		 steps{
		  waitForQualityGate abortPipeline: true
		 }
		}
     
   
   }
}