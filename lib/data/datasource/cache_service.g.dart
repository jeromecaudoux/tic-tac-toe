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
  CacheEntry<Iterable<TicTacToe>> games() => SimpleCacheEntry(
    cache: this,
    path: 'games',
    name: null,
    isPersistent: true,
    maxAge: null,
    fromJson: (json) => (json as List)
        .map((e) => TicTacToe.fromJson(e as Map<String, dynamic>))
        .toList(),
    toJson: null,
  );
}
