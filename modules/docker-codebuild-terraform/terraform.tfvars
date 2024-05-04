account_id = "211125766521"
codebuild_params = {
      "NAME" = "codebuild-demo-terraform"
      "GIT_REPO" = "https://github.com/PradeepLokhande-GSLab/docker-simple-webpage.git"
      "IMAGE" = "aws/codebuild/standard:4.0"
      "TYPE" = "LINUX_CONTAINER"
      "COMPUTE_TYPE" = "BUILD_GENERAL1_SMALL"
      "CRED_TYPE" = "CODEBUILD"
  } 

environment_variables = {
      "AWS_DEFAULT_REGION" = "us-east-1"
      "AWS_ACCOUNT_ID" = "211125766521"
      "IMAGE_REPO_NAME" = "spring-app"
      "IMAGE_TAG" = "latest"
  }