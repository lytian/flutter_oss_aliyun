import 'dart:async';

import 'model/auth.dart';

mixin AuthMixin {
  late final FutureOr<OssAuth> Function() authGetter;

  OssAuth? auth;

  /// get auth information from sts server
  Future<OssAuth> getAuth() async {
    if (isUnAuthenticated) {
      auth = await authGetter();
      return auth!;
    }
    return auth!;
  }

  /// whether auth is valid or not
  bool get isUnAuthenticated {
    return auth == null || auth!.isExpired;
  }
}
