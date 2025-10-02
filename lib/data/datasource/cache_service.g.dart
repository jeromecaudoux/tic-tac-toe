// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_service.dart';

// **************************************************************************
// LocalStoreCacheGenerator
// **************************************************************************

// ignore_for_file: unnecessary_string_interpolations
class _CacheService extends CacheService {
  _CacheService();

  @override
  String get name => "cache";

  @override
  CacheEntry<GamesContainer> games() => SimpleCacheEntry(
    cache: this,
    path: 'games',
    name: null,
    isPersistent: true,
    maxAge: null,
    fromJson: GamesContainer.fromJson,
    toJson: null,
  );
}
