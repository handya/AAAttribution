# AAAttribution
A simple library for Vapor to fetch a users attribution record

[AdServices](https://developer.apple.com/documentation/ad_services)

### Usage:

```swift
import AAAttribution

let record: AAAttributionRecord = try await AAAttribution.fetchRecord(token, client: req.client)

if record.attribution {
  // The API finds a matching attribution record
}

```

Getting the token on iOS
```swift
import AdServices

let token = try AAAttribution.attributionToken()
```
