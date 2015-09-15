Feature: api
  Background:
    Given access 'http://staging.arubaito-ex.jp'

  Scenario: visit /premium/api/jobs jobs api
    When visit "/premium/api/jobs"
      Then response code is "200"
      Then response includes "塚田農場"
      Then response includes '"brand_id":101'
      Then response includes '"company_id":10'
      Then response includes '"job_images":[{"url":"https://premiumjob-develop.s3-ap-northeast-1.amazonaws.com/job_images'

  Scenario: visit /premium/api/jobs?page=1 jobs api page
    When visit "/premium/api/jobs?page=1"
      Then response code is "200"
      Then response includes "塚田農場"

  Scenario: visit /premium/api/job_approval_ids job_approval_ids api page
    When visit "/premium/api/job_approval_ids?ids=10000,10001,10002"
      Then response code is "200"
      Then response includes "10001,10002"