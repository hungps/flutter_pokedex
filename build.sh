#!/bin/bash
# Build script for Flutter Pokedex after PokeAPI migration

set -e

echo "🔧 Installing dependencies..."
flutter pub get

echo "🏗️  Generating code..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "✅ Build complete!"
echo ""
echo "You can now run the app with:"
echo "  flutter run"
