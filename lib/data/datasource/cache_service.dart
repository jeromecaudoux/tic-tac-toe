import 'package:cache_annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/games_container.dart';

part 'cache_service.g.dart';

final cacheServiceProvider = Provider((ref) => _CacheService());

@LocalStoreCache('cache')
abstract class CacheService with LocalStoreCacheMixIn {
  @persistent
  @Cached(path: 'games')
  CacheEntry<GamesContainer> games();
}
