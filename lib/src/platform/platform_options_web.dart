import 'platform_options.dart';

class PlatformOptionsWeb extends PlatformOptions {
  final String uri;

  const PlatformOptionsWeb({required this.uri});

  @override
  Map<String, Object> jsonMap() {
    Map<String, Object> map = new Map<String, Object>()..['uri'] = uri;
    return map;
  }
}
