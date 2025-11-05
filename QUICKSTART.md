# Quick Start Guide - PokeAPI Migration

## What You Need to Do

### 1. Generate Code (Required)
The new PokeAPI models need code generation to create `.g.dart` files:

```bash
# Quick way - use the build script
./build.sh

# Or manually
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- All `.g.dart` files for PokeAPI models
- Updated `di.config.dart` for dependency injection

### 2. Test the App

```bash
flutter run
```

**Expected Behavior**:
- App starts normally
- Pokemon list loads (fetches from PokeAPI as you scroll)
- First time viewing each Pokemon: Slight delay while fetching
- Second time: Instant load from cache
- Works offline for previously viewed Pokemon

### 3. Verify Caching

**Test HTTP Cache**:
1. Launch app and view some Pokemon
2. Close app
3. Relaunch app
4. View the same Pokemon → Should load instantly

**Test Offline Mode**:
1. View several Pokemon while online
2. Turn off network/airplane mode
3. Navigate to those Pokemon → Should still display

## Troubleshooting

### Build Errors
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### "Missing .g.dart file" Errors
You need to run build_runner (see step 1 above)

### Network Errors
Check:
- Internet connection is active
- PokeAPI is accessible (visit https://pokeapi.co/api/v2/pokemon/1/ in browser)
- No firewall blocking the API

### Slow Performance
- First load of each Pokemon is slower (API fetch)
- Subsequent loads are instant (cache)
- This is expected behavior with on-demand fetching

## What Changed

### ✅ Now Using PokeAPI
- Old: `https://gist.githubusercontent.com/.../pokemons.json`
- New: `https://pokeapi.co/api/v2/pokemon/{id}/`

### ✅ On-Demand Fetching
- Old: All 809 Pokemon downloaded at once
- New: Each Pokemon fetched only when viewed

### ✅ Two-Tier Caching
1. HTTP cache (30 days) - for raw API responses
2. Hive cache (permanent) - for processed data

### ✅ Same Features
- All Pokemon data (#001-#809)
- Evolution chains
- Base stats
- Types and weaknesses
- Pokemon details
- Items

## Files Changed

**New Files**:
- `lib/data/source/pokeapi/` - All PokeAPI models and datasource
- `lib/data/source/mappers/pokeapi_to_local_mapper.dart` - Data transformation
- `POKEAPI_MIGRATION.md` - Detailed migration guide
- `IMPLEMENTATION_SUMMARY.md` - Architecture documentation
- `build.sh` - Build helper script

**Modified Files**:
- `lib/data/repositories/pokemon_repository.default.dart` - Uses PokeAPI
- `lib/data/repositories/item_repository.default.dart` - Uses PokeAPI
- `lib/di.dart` - HTTP caching configuration
- `pubspec.yaml` - New dependencies

## Next Steps

1. Run `./build.sh` (or the commands in step 1)
2. Test the app with `flutter run`
3. If everything works, the migration is complete! 🎉

## Need Help?

Check the detailed documentation:
- `IMPLEMENTATION_SUMMARY.md` - Technical details
- `POKEAPI_MIGRATION.md` - Migration details
