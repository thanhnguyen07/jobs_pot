# Jobs Pot
## easy_localization
**Generated Code**

>folder: lib/resources/i18n/generated

`file codegen_loader.g.dart`
```
fvm flutter pub run easy_localization:generate -S "lib/resources/i18n/langs" -O "lib/resources/i18n/generated"
```

`file locale_keys.dart`
```
fvm flutter pub run easy_localization:generate -S "lib/resources/i18n/langs" -O "lib/resources/i18n/generated" -o "locale_keys.dart" -f keys
```
`All in one`
```
fvm flutter pub run easy_localization:generate -S "lib/resources/i18n/langs" -O "lib/resources/i18n/generated" && fvm flutter pub run easy_localization:generate -S "lib/resources/i18n/langs" -O "lib/resources/i18n/generated" -o "locale_keys.dart" -f keys
```
## auto_route

**Add the new screen**

**Config**

Add `@RoutePage()` to the screen files.

Example
```
@RoutePage()    
class HomeScreen extends StatefulWidget {}
```
**Generated code**

Use the [watch] flag to watch the files' system for edits and rebuild as necessary.

```
flutter packages pub run build_runner watch
```

if you want the generator to run one time and exit, use
```
flutter packages pub run build_runner build
```