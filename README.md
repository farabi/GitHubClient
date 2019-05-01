# GitHubClient

- GitHub client iOS application.

## Features 

- Search for a public GitHub repository.
- Display the repository overview.
- List of issues.
- List of Contributors.
- List of open pull requests.

## Swift Version

This project is built on XCode 10.2 and Swift 5. 

## Design patterns

- The application was done according to MVVM architecture.
- Coordinator pattern for screens navigation. [More info](https://medium.com/@saad.eloulladi/ios-coordinator-pattern-in-swift-39a15aa3b01b)

<aside class="notice">
ℹ️ I preferred MVVM over VIPER or VIP due to the reactive nature of the search feature, and  also for the the project size.
</aside>

## CocoaPods

No need to run pod install, libraries are already included. [Here is why](https://stackoverflow.com/questions/9446644/what-goes-into-your-gitignore-if-youre-using-cocoapods)

- I used RxSwift for viewModel data binding.
- Alamofire for networking. [Here is why](https://www.avanderlee.com/swift/alamofire-vs-urlsession/)
- R.swift to generate Assets.
- And XLPagerTabStrip for the UI tabs.

<aside class="warning">
⚠️  I was planning to use swinject and mocking libraries, unfortunately they are not yet compatible with swift 5. So i had to do dependency injection and mocking manually.
</aside>

### Unit tests

- Unit Tests are done using Quick & Nibmle libraries.
- I used also RxNimble extention to reactive viewModels. 

### Test coverage

<aside class="warning">
⚠️  Generated classes and views are not included in the test coverage report.
Generated code with R.swift is not testable. 
And it's not common to test UI since its related to the application lifecycle.
</aside>


