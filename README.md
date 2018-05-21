# SwiftyOnce
[![Build Status](https://travis-ci.org/ktustanowski/SwiftyOnce.svg?branch=master)](https://travis-ci.org/ktustanowski/SwiftyOnce)
![Carthage compatibile](https://camo.githubusercontent.com/3dc8a44a2c3f7ccd5418008d1295aae48466c141/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f43617274686167652d636f6d70617469626c652d3442433531442e7376673f7374796c653d666c6174)

Unit test friendly dispatch_once replacement for Swift3.

## Usage

```swift
Once.dispatch(withToken: "someAppUniqueToken") {
  /* this will be dispatched only once */
}
```

## Unit tests
First you have to update your unit tests scheme (*Edit scheme*) and and in *Test* section in *Environment Variables* add **IN_TESTS** set to YES. Without this assertion will be called when you try to remove the token. This is to ensure no one do this unintentionally on production code:
```swift
Once.remove(token: "someAppUniqueToken")
```
## Carthage
```
github "ktustanowski/SwiftyOnce"
```
## Final notes
I tried DispatchQueue extension at first but I had serious issues in unit tests which seems to be or was a known bug - this radar says its fixed -> https://openradar.appspot.com/radar?id=4624971611504640 but my experience says its not the whole truth. It wasn't working for me for iOS < 10

Thanks Rolling-Rabbits for the idea -> http://rolling-rabbits.com/2016/07/21/grand-central-dispatch-in-swift-3/
