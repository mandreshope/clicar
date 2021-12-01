String get logTrace =>
    '[EVENT] ' +
    StackTrace.current.toString().split("\n").toList()[1].split("      ").last;

String get firstCurrentStackTrace => StackTrace.current
    .toString()
    .split("\n")
    .toList()[1]
    .split("      ")
    .last
    .split(" ")
    .first
    .toString();

const String baseUrl = "https://mybase.url.com/";

const String cachedToken = "CACHED_TOKEN";

///endpoint
const String loginEndPoint = "/login";
