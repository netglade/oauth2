// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'constants.dart';

/// Adds additional query parameters to [url], overwriting the original
/// parameters if a name conflict occurs.
Uri addQueryParameters(Uri url, Map<String, String> parameters) =>
    url.replace(queryParameters: Map.from(url.queryParameters)..addAll(parameters));

String basicAuthHeader(String identifier, String secret) {
  var userPass = '${Uri.encodeFull(identifier)}:${Uri.encodeFull(secret)}';
  return 'Basic ${base64Encode(ascii.encode(userPass))}';
}

void addTrackingHeaders(Map<String, String> headers, String? trackingId, Map<String, String>? additionalHeaders) {
  if (additionalHeaders != null) {
    if (additionalHeaders[HttpHeadersConsts.userUID] != null) {
      headers[HttpHeadersConsts.userUID] = additionalHeaders[HttpHeadersConsts.userUID]!;
    }
    if (additionalHeaders[HttpHeadersConsts.globalUserId] != null) {
      headers[HttpHeadersConsts.globalUserId] = additionalHeaders[HttpHeadersConsts.globalUserId]!;
    }
    if (additionalHeaders[HttpHeadersConsts.trackingId] != null) {
      headers[HttpHeadersConsts.trackingId] = additionalHeaders[HttpHeadersConsts.trackingId]!;
    }
    if (additionalHeaders[HttpHeadersConsts.applicationVersion] != null) {
      headers[HttpHeadersConsts.applicationVersion] = additionalHeaders[HttpHeadersConsts.applicationVersion]!;
    }
    if (additionalHeaders[HttpHeadersConsts.appVersion] != null) {
      headers[HttpHeadersConsts.appVersion] = additionalHeaders[HttpHeadersConsts.appVersion]!;
    }
    if (additionalHeaders[HttpHeadersConsts.clientOs] != null) {
      headers[HttpHeadersConsts.clientOs] = additionalHeaders[HttpHeadersConsts.clientOs]!;
    }
  }
  if (trackingId != null) headers[HttpHeadersConsts.trackingId] = trackingId;
}
