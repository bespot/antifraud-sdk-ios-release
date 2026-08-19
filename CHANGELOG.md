# 1.2.1 (2026-08-18)

### Added
- New `SDKError` case `quotaReachedForPlan`, returned when the account has reached the request quota of its current plan.

# 1.2.0 (2026-07-10)

### Added
- Bearer-token authentication as an alternative to OAuth 2.0 via a new `initialize(apiBaseUrl:apiKey:accessToken:)` overload.
- Public method `setAccessToken(_:)` to refresh the bearer token.
- New `SDKError` cases for access-token flows: `invalidToken`, `authError`

# 1.1.4 (2025-12-10)

### Fixed
- Location updates are now started on the main thread to ensure correct Core Location behavior and improve stability.

### Added
- Support Swift 6.2.1

# 1.1.3 (2025-08-28)

### Fixed
- Duplicate messages when debug logging was enabled

### Changed
- `SDKError` supported cases (added in readme as well)

# 1.1.2 (2025-05-30)

### Added
- Public method `subscribe(subscribeCompletion:)` to allow clients to observe real-time fraud detection updates.
- Public method `unsubscribe()` to stop receiving fraud detection updates.

# 1.1.1 (2025-05-07) Support Swift Package Manager

### Added
- Support Swift Package Manager
- Support Swift 6.1

# 1.0.0 (2024-11-25)

### Added
- Enhanced authentication supporting OAuth 2.0

### Changed
- Method `initialize` requires extra arguments - find more info in readme

# 0.5.3 (2024-11-13)

### Added
- New checks to enrich VPN and proxy detection
- New checks to enrich Jailbreak (Root) detection
- Enhanced Device Fingerprinting mechanism

### Fixed
- Remove unneeded debug prints
- Remove hard-coded parameters

# 0.5.2 (2024-10-10)

### Added
- Detection for VPN

# 0.5.1 (2024-09-16)

### Fixed
- Bundle identifier and version number for application

# 0.5.0 (2024-09-04)

### Added
- Detections for Geofencing, Mock Location & Multiple Users
