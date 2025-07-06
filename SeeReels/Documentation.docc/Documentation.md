# SeeReels demo app

IG Reels inspired app showing an infinite scrolling list of users.

## Main Focuses
- **Infinite scrolling + pagination**
- **Separation of concerns**  
  - **Models**: `User` mirrors the provided JSON with an additional `seen` property.  
  - **Service**: `UserFetching` protocol + `MockUserService` to simulate loading pages of users.  
  - **Store**: `UserStore` manages fetching, and exposes a `@Published` array of users.
- Clean commit history (with titles + messages!) documenting my process.

- note: I prefer using "Store" instead of the MVVM terminology as I find it helps me think in a view agnostic way and improves reusability, [see this article on the Apple Developer Forums](https://developer.apple.com/forums/thread/699003) for my inspiration.

- important: I did not implement any persistence as I focused on the UI, model layer, and **documentation**.

## Tradeoffs

- **Persistence omitted**  
  I focused on delivering a polished UI & documentation. Persistence (seen/liked state) would be the next step—e.g. via `UserDefaults` or CoreData—but was de-scoped for this 4 h slice.  
- **Scroll performance**
  If this was a production app, I might've used a `UICollectionView` for the user list/story view (or maybe even a grid!).
- **Testing surface**  
  Added unit tests for UserStore loading method. UI tests and snapshot tests are out of scope but would be important in a full release.
- **Modularization**  
  For larger projects, I’d split models, services, and UI into separate Swift Packages for better modularity.

## What's next

Here are some natural extensions and improvements I could tackle now that the core feed is in place:

- **State Persistence**  
  Store “seen” and “liked” flags across launches (e.g. via `UserDefaults` or Core Data).  
- **Full-Screen Story View**  
  Implement a tappable, swipeable story player (progress bars, like button, back navigation).  
- **Real Network Paging**  
  Swap `MockUserService` for a live API service with real pagination, error-retry and caching.  
- **Image Caching & Placeholders**  
  Integrate an in-memory or disk cache (e.g. `URLCache` or a package like Kingfisher) and show shimmer/placeholder while loading.  
- **Accessibility & Localization**  
  Add VoiceOver labels, Dynamic Type support, high-contrast colors, and full localization (including right-to-left).  
- **UI Tests & Snapshot Testing**  
  Write end-to-end SwiftUI tests for the feed and story view; capture golden snapshots for visual regression.  
- **Modularization**  
  Extract Models, Services, and Views into separate Swift Packages for better decoupling and reusability.  
- **Offline Support & Error States**  
  Display cached content when offline and show friendly error UIs with retry controls.  
- **Analytics & CI/CD**  
  Hook up basic analytics (e.g. story impressions, likes) and configure a CI pipeline to run tests & build docs on every push.  
- **Localization**  
  Le projet est configuré pour supporter plusieurs langues.  J'aurais aimé ajouter les traductions françaises mais fallait prioriser d'autres tâches! 🇫🇷👀

## Links 🔗

📲 [IG Reels App Store Page](https://apps.apple.com/us/app/instagram/id389801252)
