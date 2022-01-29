### Goal

The lowest latency on a serverless functions (AWS Lambda) and have ultra low latency performance

### M1: API Gateway + AWS Lambda

Create a proxy api gateway that simply as proxies requests to AWS lambda. We can benefit from caching at the edge by
deploying a regional distribution of API gateway.

(API Gateway) ---> Authorizer (Lambda) ---> Remix Server (Lambda)

### M2: ALB + AWS Lambda

Discarded since there is not a ton of benefits over using API Gateway for our use cases. The biggest benefit is if you are
dealing with higher concurrency than 10,000 then ALB would be the right solution.

(ALB) ---> AWS Lambda

### M3: CloudFront + AWS Lambda

This approach offers the most flexibility with controlling our routing layer which is the CloudFront. The problem
with the api gateway managed cf distribution is that we do not have control over it.

Lambda@Edge (Authorization) ---> CDN (CloudFront) ---> Remix Server (Lambda)
