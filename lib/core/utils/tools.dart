import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:permission_handler/permission_handler.dart';

Duration transitionDuration = const Duration(milliseconds: 150);

String getMessage(BuildContext context, Object? e) {
  if (e is FirebaseFunctionsException) {
    if (e.plugin == 'firebase_functions' && e.message?.isNotEmpty == true) {
      return e.message!;
    }
  }
  if (e is FirebaseAuthException) {
    if (e.code == 'invalid-credential') {
      return I18n.of(context).invalidCredential;
    }
  }
  if (e is PlatformException) {
    if (e.code == 'IO_ERROR') {
      return I18n.of(context).checkInternetConnection;
    }
  }
  if (e is String) {
    return e;
  }
  return I18n.of(context).genericError;
}

extension WidgetListExtension<T> on Iterable<T> {
  List<T> joinSeparator(T separator, {bool bottom = false}) {
    Iterator<T> iterator = this.iterator;
    if (!iterator.moveNext()) return [];
    List<T> output = [];
    output.add(iterator.current);
    while (iterator.moveNext()) {
      output.add(separator);
      output.add(iterator.current);
    }
    if (bottom) output.add(separator);
    return output;
  }
}

Timestamp? dateTimeToJson(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return safeDateTimeToJson(dateTime);
}

Timestamp safeDateTimeToJson(DateTime dateTime) {
  return Timestamp.fromDate(dateTime.toUtc());
}

DateTime? dateTimeFromJson(dynamic json) {
  if (json == null) {
    return null;
  }
  return safeDateTimeFromJson(json);
}

DateTime safeDateTimeFromJson(dynamic json) {
  if (json == null) {
    throw Exception('json is null');
  }
  if (json is Map) {
    // {_nanoseconds: 202000000, _seconds: 1758619555}
    if (json.containsKey('_seconds') && json.containsKey('_nanoseconds')) {
      return DateTime.fromMillisecondsSinceEpoch(
        (json['_seconds'] as int) * 1000 +
            (json['_nanoseconds'] as int) ~/ 1000000,
      ).toLocal();
    }
  }
  if (json is Timestamp) {
    return json.toDate().toLocal();
  }
  if (json is String) {
    try {
      return DateFormat(
        "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      ).parse(json, true).toLocal();
    } catch (e) {
      return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(json, true).toLocal();
    }
  }
  return DateTime.fromMillisecondsSinceEpoch(json);
}

extension DateTimeExt on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}

extension MapExt on Map<String, dynamic> {
  Map<String, dynamic> withTsDate() {
    return map((String key, dynamic value) {
      if (value is Timestamp) {
        return MapEntry(
          key,
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(value.toDate().toUtc()),
        );
      }
      if (value is Map<String, dynamic>) {
        return MapEntry(key, value.withTsDate());
      }
      if (value is Iterable) {
        return MapEntry(
          key,
          value
              .map((e) => e is Map<String, dynamic> ? e.withTsDate() : e)
              .toList(),
        );
      }
      return MapEntry(key, value);
    });
  }
}

/// Recursively converts any JSON-like structure into:
/// - `Map<String, dynamic>`
/// - `List<dynamic>`
/// - JSON types (`num`, `String`, `bool`, `null`)
///
/// Optionally, it can also normalize Firestore Timestamps to ISO 8601 strings.
/// This ensures consistent data representation, especially when dealing with data from various sources.
dynamic deepNormalize(dynamic value, {bool convertTimestampsToIso = false}) {
  if (value is Map) {
    // force keys to String and normalize values
    return value.map<String, dynamic>(
      (k, v) => MapEntry(
        k.toString(),
        deepNormalize(v, convertTimestampsToIso: convertTimestampsToIso),
      ),
    );
  }
  if (value is List) {
    return value
        .map(
          (e) =>
              deepNormalize(e, convertTimestampsToIso: convertTimestampsToIso),
        )
        .toList();
  }
  if (value is Timestamp) {
    // either keep Timestamp or serialize to ISO 8601
    return convertTimestampsToIso ? value.toDate().toIso8601String() : value;
  }
  if (value is DateTime) {
    return convertTimestampsToIso ? value.toIso8601String() : value;
  }
  // String / num / bool / null pass as is
  return value;
}

Future<void> openBiometricSettings() async {
  if (Platform.isAndroid) {
    try {
      const intentEnroll = AndroidIntent(
        action: 'android.settings.BIOMETRIC_ENROLL',
        // EXTRA_BIOMETRIC_AUTHENTICATORS_ALLOWED is not exposed on the Flutter side,
        // but the intent is sufficient; if not supported -> catch and fallback.
      );
      await intentEnroll.launch();
      return;
    } catch (e, s) {
      debugPrint('Failed to open BIOMETRIC_ENROLL intent: $e\n$s');
    }

    // Fallback: Security screen
    try {
      const intentSecurity = AndroidIntent(
        action: 'android.settings.SECURITY_SETTINGS',
      );
      await intentSecurity.launch();
      return;
    } catch (e, s) {
      debugPrint('Failed to open SECURITY_SETTINGS intent: $e\n$s');
    }

    // Last fallback: general settings
    try {
      const intentSettings = AndroidIntent(
        action: 'android.settings.SETTINGS',
      );
      await intentSettings.launch();
      return;
    } catch (e, s) {
      debugPrint('Failed to open SETTINGS intent: $e\n$s');
    }
  } else if (Platform.isIOS) {
    // iOS: we CANNOT directly open Face ID & Passcode.
    // The only public API is to open the app settings.
    await openAppSettings(); // from permission_handler
  }
}
