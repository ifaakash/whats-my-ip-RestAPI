resource "aws_api_gateway_rest_api" "api" {
  name = "whats-my-RESTAPI"
  description = "REST API for lambda gateway"
}

resource "aws_api_gateway_resource" "link"{
  parent_id = aws_api_gateway_rest_api.api.root_resource_id
  path_part =
  rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_method" "method"{
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.link.id
  authorization = "NONE"
  http_method = "GET"
}

resource "aws_api_gateway_integration" "integration"{
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.link.id
  http_method = "GET"
  integration_http_method = "POST"
  type = "AWS_PROXY"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  triggers = {
    redeployment= sha1(jsonencode(
      [
        aws_api_gateway_integration.integration.id,
        aws_api_gateway_method.method.id
      ]
    ))
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "stage"{
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name = "dev"
  deployment_id = aws_api_gateway_deployment.deployment.id
}
