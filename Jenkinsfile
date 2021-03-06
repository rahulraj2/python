node {
    ENV_APPLICATION_NAME='python-pipeline'

    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'github', url: git@github.com:rahulraj2/sharedlibrary.git']]])
    load 'CIJenkinsfile'
}
