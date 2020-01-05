## Aws Pricing App
- App can be used to monitor pricing for different AWS offerings.
- Pricing data is updated daily at midnight if data is changed.
- Old pricing is preserved.

## Technology Stack

 1. Rails 6.0.2.1
 2. ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-linux]
 3. MySql 8.0.18-0ubuntu0.19.10.1 (Ubuntu)

### GET /service/AmazonCloudFront/region/us-east-1
http://localhost:3000/service/AmazonCloudFront/region/us-east-1

     [
          {
            "description": "$6.0E-7  per Request for  in US East (N. Virginia)",
            "beginRange": "0",
            "endRange": "Inf",
            "unit": "Request",
            "pricePerUnit": "0.0000006000",
            "effectiveDate": "2019-12-01T00:00:00.000Z"
          },
          {
            "description": "$0.00005001 per Lambda-GB-Second for  in US East (N. Virginia)",
            "beginRange": "0",
            "endRange": "Inf",
            "unit": "Lambda-GB-Second",
            "pricePerUnit": "0.0000500100",
            "effectiveDate": "2019-12-01T00:00:00.000Z"
          }
        ]

### GET /service/AmazonCloudFront/region/us-east-1?date=
http://localhost:3000/service/AmazonCloudFront/region/us-east-1?date=2020-01-05

    [
      {
        "description": "$6.0E-7  per Request for  in US East (N. Virginia)",
        "beginRange": "0",
        "endRange": "Inf",
        "unit": "Request",
        "pricePerUnit": "0.0000006000",
        "effectiveDate": "2019-12-01T00:00:00.000Z"
      },
      {
        "description": "$0.00005001 per Lambda-GB-Second for  in US East (N. Virginia)",
        "beginRange": "0",
        "endRange": "Inf",
        "unit": "Lambda-GB-Second",
        "pricePerUnit": "0.0000500100",
        "effectiveDate": "2019-12-01T00:00:00.000Z"
      }
    ]


## Call Or  Add other Offer code
    Example:-
      ApiPriceCaller.new("Offer Code").call
    
        ApiPriceCaller.new("transcribe").call 