import 'package:appflowy/generated/flowy_svgs.g.dart';
import 'package:appflowy/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ImportType {
  historyDocument,
  historyDatabase,
  markdownOrText,
  csv,
  afDatabase;

  @override
  String toString() {
    switch (this) {
      case ImportType.historyDocument:
        return LocaleKeys.importPanel_documentFromV010.tr();
      case ImportType.historyDatabase:
        return LocaleKeys.importPanel_databaseFromV010.tr();
      case ImportType.markdownOrText:
        return LocaleKeys.importPanel_textAndMarkdown.tr();
      case ImportType.csv:
        return LocaleKeys.importPanel_csv.tr();
      case ImportType.afDatabase:
        return LocaleKeys.importPanel_database.tr();
    }
  }

  WidgetBuilder get icon => (context) {
        final FlowySvgData svg;
        switch (this) {
          case ImportType.historyDatabase:
            svg = FlowySvgs.document_s;
          case ImportType.historyDocument:
          case ImportType.csv:
          case ImportType.afDatabase:
            svg = FlowySvgs.board_s;
          case ImportType.markdownOrText:
            svg = FlowySvgs.text_s;
        }

        return FlowySvg(
          svg,
          color: Theme.of(context).colorScheme.tertiary,
        );
      };

  bool get enableOnRelease {
    switch (this) {
      case ImportType.historyDatabase:
      case ImportType.historyDocument:
      case ImportType.afDatabase:
        return kDebugMode;
      default:
        return true;
    }
  }

  List<String> get allowedExtensions {
    switch (this) {
      case ImportType.historyDocument:
        return ['afdoc'];
      case ImportType.historyDatabase:
      case ImportType.afDatabase:
        return ['afdb'];
      case ImportType.markdownOrText:
        return ['md', 'txt'];
      case ImportType.csv:
        return ['csv'];
    }
  }

  bool get allowMultiSelect {
    switch (this) {
      case ImportType.historyDocument:
      case ImportType.historyDatabase:
      case ImportType.csv:
      case ImportType.afDatabase:
      case ImportType.markdownOrText:
        return true;
    }
  }
}
