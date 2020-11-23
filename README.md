# Ninety Nine Challenge

Here is my solution to Ninety Nine's challenge. And now, I would like to argue my decisions, their advantages and tradeoffs, and whys:

## Decisions
- <b>Architecture: </b>

  In this project I'm using Clean Architecture in order to split application functionality in three layers; Data, Domain and Presentation. 
Probably for this project is not needed since is a basic one (in which data model and domain model is almost the same), but this decision has demonstrative purposes (how I use to architect my own projects) as well as scalability for a real project.
- <b>MVVM for Presentation layer:</b>

  I decided to use MVVM for Presentation layer since allow us to reduce views' complexity isolating presentation logic from views as well as increment their usability.
- <b>RxSwift:</b>

  It is an industry standard because together with MVVM reduce a lot of code to binding view events to viewModels. Without using it will force us to use delegates or callbacks extensively.
- <b>Cache strategy:</b>

  Due all API's data are static, I decided to use a basic cache strategy in which all requests are being stored in order to increase application speed as well as allow offline mode. So, if a request is available in cache, will be retrieved from it, otherwise will be requested to server. However, each request can have a specific caching strategy setted in RequestBuilder.

## Points to improve
- <b>Navigation: </b>

  With only two screens navigation is well handled but if we think in terms of scalability, we should explore other solutions as split ViewControllerFactory into specific builders for each module. 
  
- <b>Presentation layer tests: </b>

  Due to application's purpose as well as presentation layer's simplicity, doesn't seem to be the best investment make tests for presentation layer, but obviously in a production app will be totally worth it.

- <b>Accessibility: </b>
  
  In production app we should use Dynamic Types as well as VoiceOver, for instance, in order to make more accessible the app.
  
- <b>Localization</b>

- <b>Cache:</b>
  
  Depending on server cache policy, even if server implements HTTP Cache-Control standard, will be easy to improve cache invalidating data when its necessary thanks to URLCache.

- <b>Security:</b>
  
  Due to we are handling sensible data, we should implement options like code obfuscation, two factor authentication, SSL Certificate Pinning, etc.

## License
[MIT](https://choosealicense.com/licenses/mit/)
