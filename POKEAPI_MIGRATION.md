# PokeAPI Migration - Build Instructions

This document describes the steps needed to complete the PokeAPI migration.

## What Was Changed

The application has been migrated from using a GitHub Gist JSON file to the official PokeAPI (https://pokeapi.co/api/v2).

### Key Changes:
1. **New Data Models**: Created PokeAPI response models in `lib/data/source/pokeapi/models/`
2. **New Data Source**: `PokeApiDataSource` replaces `GithubDataSource`
3. **New Mappers**: `PokeApiToLocalMapper` converts PokeAPI responses to Hive models
4. **HTTP Caching**: Added `dio_cache_interceptor` for proper API response caching
5. **On-Demand Fetching**: Pokemon and Items are now fetched on-demand rather than all at once

## Build Steps

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Generate Code

The new PokeAPI models use `json_serializable` and require code generation:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate the following files:
- `lib/data/source/pokeapi/models/pokemon.g.dart`
- `lib/data/source/pokeapi/models/pokemon_species.g.dart`
- `lib/data/source/pokeapi/models/evolution_chain.g.dart`
- `lib/data/source/pokeapi/models/type.g.dart`
- `lib/data/source/pokeapi/models/item.g.dart`
- Updated `lib/di.config.dart`

### 3. Clean Build (if needed)

If you encounter any issues:

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## Architecture

### Caching Strategy

The application now uses a two-tier caching approach:

1. **HTTP Cache** (via dio_cache_interceptor):
   - Caches raw API responses
   - 30-day expiration
   - Stored in temporary directory using Hive
   - Policy: `CachePolicy.request` (respects cache headers, uses cache if available)

2. **Local Cache** (via Hive):
   - Caches processed Pokemon/Item entities
   - Persistent storage
   - Used for offline access and quick loading

### Data Flow

```
PokeAPI → PokeApiDataSource → PokeApiToLocalMapper → Hive (LocalDataSource) → Entity Models → UI
```

### On-Demand Fetching

- **Pokemon are fetched only when requested** - no pre-fetching or batch loading
- When `getPokemons(page, limit)` is called, each Pokemon in that range is fetched individually if not already cached
- When viewing a Pokemon's details, its evolution chain Pokemon are also fetched on-demand
- **Items follow the same pattern** - fetched individually as needed
- HTTP cache ensures repeated requests for the same Pokemon/Item are served from cache
- First time viewing a Pokemon may be slower, but subsequent views will be instant

## Testing

After building, test the following:

1. **First Launch**: Verify Pokemon load correctly from PokeAPI
2. **Second Launch**: Verify data loads from cache (should be fast)
3. **Offline Mode**: Verify cached data is accessible offline
4. **Pokemon Details**: Check that evolution chains and stats display correctly
5. **Items**: Verify items load and display properly

## Troubleshooting

### Build Errors

If you see errors related to missing `.g.dart` files:
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Cache Issues

To clear all caches:
```bash
# Delete the Hive database
rm -rf [app_directory]/hive
# The app will recreate and repopulate on next launch
```

### Network Errors

If PokeAPI is unreachable:
- Check your internet connection
- PokeAPI may have rate limits (the app includes delays to respect these)
- Cached data will still be accessible

## API Differences

### Image URLs
- **Old**: Pokemon.com official artwork URLs
- **New**: PokeAPI official artwork (similar quality)

### Data Completeness
- All Pokemon data from the original dataset (#001-#809) is supported
- Evolution chains are now fetched from PokeAPI's evolution-chain endpoint
- Type effectiveness/weaknesses are calculated from type damage relations

## Performance Notes

- **Initial load is truly on-demand**: No pre-fetching of Pokemon data
- Each Pokemon is fetched individually as the user navigates
- HTTP cache layer ensures:
  - First request to PokeAPI fetches fresh data
  - Subsequent requests are served instantly from HTTP cache (30-day expiration)
- Hive cache provides:
  - Persistent storage of processed Pokemon entities
  - Offline access to previously viewed Pokemon
- Evolution chains are fetched lazily when viewing Pokemon details
- This approach minimizes initial load time and respects API rate limits
