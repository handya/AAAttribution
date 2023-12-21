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



#### Using With Vapor Queues


```swift
import Vapor
import Queues
import AAAttribution

struct AttributionBody: Content {
    let token: String
    ...
}

struct AttributeUserInstallJob: AsyncJob {
    typealias Payload = AttributionBody

    func dequeue(_ context: QueueContext, _ payload: AttributionBody) async throws {
        let record: AAAttributionRecord = try await context.application.attribution.fetchRecord(_ token: String)
        ...
    }

    func nextRetryIn(attempt: Int) -> Int {
        return 5
    }
}
```

Then dispatch a job

```swift
try await req.queue
    .dispatch(AttributeUserInstallJob.self,
              AttributionBody(token: "token"),
              maxRetryCount: 3)
```
