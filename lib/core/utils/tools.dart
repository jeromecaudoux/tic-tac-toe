import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tictactoe/core/utils/i18n.dart';

Duration transitionDuration = const Duration(milliseconds: 150);

String getMessage(BuildContext context, Object? e) {
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

dynamic dateTimeToJson(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return dateTime.toUtc().toIso8601String();
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


