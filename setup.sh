echo "I18N module"
cd i18n; 
fvm flutter pub get; 
fvm flutter pub run easy_localization:generate -S 'lib/langs' -O 'lib/generated' -o 'locale_keys.dart' -f keys;
fvm flutter pub run easy_localization:generate -S 'lib/langs' -O 'lib/generated';
cd ..;

echo "Local Storage module"
cd local_storage;
fvm flutter pub get;
cd ..;

echo "Logger module"
cd logger;
fvm flutter pub get;
cd ..;

echo "Main module"
cd main;
fvm flutter pub get;
cd ..;

echo "Models module"
cd models;
fvm flutter pub get;
fvm flutter packages pub run build_runner build --delete-conflicting-outputs;
cd ..;

echo "Network module"
cd network;
fvm flutter pub get;
cd ..;
