import 'package:logger/logger.dart';

class CustomColorLogPrinter extends LogPrinter {
  final bool useColors;

  CustomColorLogPrinter({this.useColors = true});

  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.fg(12), // Blue
    Level.info: AnsiColor.fg(10), // Green
    Level.warning: AnsiColor.fg(208), // Orange
    Level.error: AnsiColor.fg(9), // Red
    Level.wtf: AnsiColor.fg(13), // Magenta
  };

  static final levelEmojis = {
    Level.verbose: "💬",
    Level.debug: "🐞",
    Level.info: "ℹ️",
    Level.warning: "⚠️",
    Level.error: "❌",
    Level.wtf: "🔥",
  };

  @override
  List<String> log(LogEvent event) {
    final color = levelColors[event.level];
    final emoji = levelEmojis[event.level];
    final message = '$emoji ${event.message}';

    return [useColors ? color!(message) : message];
  }
}
