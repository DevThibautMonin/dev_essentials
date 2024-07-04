import 'package:dev_essentials/commons/enums/tools_enum.dart';
import 'package:dev_essentials/presentation/char_counter/char_counter_screen.dart';
import 'package:dev_essentials/presentation/qr_code_generator/qr_code_screen.dart';
import 'package:dev_essentials/presentation/text_generator/text_generator_screen.dart';
import 'package:dev_essentials/presentation/tools_screen.dart';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:dev_essentials/presentation/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  String? version = "";
  ToolsEnum currentWidget = ToolsEnum.tools;

  Widget _buildDynamicWidget() {
    switch (currentWidget) {
      case ToolsEnum.tools:
        return const ToolsScreen();
      case ToolsEnum.jsonFormatter:
        return const JsonFormatterScreen();
      case ToolsEnum.charCounter:
        return const CharCounterScreen();
      case ToolsEnum.textGenerator:
        return const TextGeneratorScreen();
      case ToolsEnum.qrCodeGenerator:
        return const QrCodeScreen();
      default:
        return const ToolsScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  void _getVersion() async {
    var infos = await PackageInfo.fromPlatform();
    version = infos.version;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            children: [
              Toolbar(
                onToolChanged: (p0) {
                  setState(() {
                    currentWidget = p0;
                  });
                },
                version: version,
              ),
            ],
          ),
        ),
        Flexible(
          flex: 8,
          child: Container(
            color: Colors.white,
            child: _buildDynamicWidget(),
          ),
        ),
      ],
    );
  }
}
