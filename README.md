# SwiftyOnce
Unit test friendly dispatch_once replacement for Swift3.

##Usage

```swift
Once.dispatch(withToken: "someAppUniqueToken") {
  /* this will be dispatched only once */
}
```

##Unit tests
First you have to update your unit tests scheme (*Edit scheme*) and and in *Test* section in *Environment Variables* add **IN_TESTS** set to YES. Without this assertion will be called when you try to remove the token. This is to ensure no one do this unintentionally on production code:
```swift
Once.remove(token: "someAppUniqueToken")
```
## Carthage
```
github "ktustanowski/SwiftyOnce" == 0.1.0
```
I tried DispatchQueue extension at first but I had serious issues in unit tests which seems to be or was a known bug - this radar says its fixed -> https://openradar.appspot.com/radar?id=4624971611504640 but my experience says its not the whole truth. It wasn't working for me for iOS < 10

Thanks Rolling-Rabbits for the idea -> http://rolling-rabbits.com/2016/07/21/grand-central-dispatch-in-swift-3/
