import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/pages/document/bloc/document_bloc.dart';
import 'package:clicar/app/presentation/pages/document/enums/document_associate.dart';
import 'package:clicar/app/presentation/pages/document/types/document_item.dart';
import 'package:clicar/app/presentation/pages/document/types/document_picker.dart';
import 'package:clicar/app/presentation/widgets/basic_widgets.dart';
import 'package:clicar/app/presentation/widgets/circular_progress_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class DocumentExpandable extends StatelessWidget {
  final DocumentPicker documentPicker;
  const DocumentExpandable({Key? key, required this.documentPicker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final documentBloc = context.read<DocumentBloc>();
    return BlocBuilder<DocumentBloc, BaseState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Image.file(
                documentPicker.file,
                width: 100.w(context),
                height: 20.h(context),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpandableNotifier(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: CustomTheme.greyColor,
                ),
                child: ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 0.0),
                        child: Text(
                          documentPicker.type != null
                              ? documentPicker.type!.label
                              : 'type de document'.toUpperCase(),
                          style: CustomTheme.mainBtnTextStyle.copyWith(
                            color: CustomTheme.primaryColor,
                            fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                ?.sp(context),
                          ),
                        )),
                    collapsed: const SizedBox.shrink(),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        ...documentBloc.types
                            .map((documentItem) => InkWell(
                                  onTap: () {
                                    documentBloc.add(SelectTypeDocumentEvent(
                                        documentPicker: documentPicker,
                                        documentItem: documentItem));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(documentItem.label),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpandableNotifier(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: CustomTheme.greyColor,
                ),
                child: Column(
                  children: <Widget>[
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 0.0),
                            child: Text(
                              documentPicker.associated != null
                                  ? documentPicker.associated!.label
                                  : 'associer'.toUpperCase(),
                              style: CustomTheme.mainBtnTextStyle.copyWith(
                                color: CustomTheme.primaryColor,
                                fontSize: CustomTheme.mainBtnTextStyle.fontSize
                                    ?.sp(context),
                              ),
                            )),
                        collapsed: const SizedBox.shrink(),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            ...documentBloc.associates
                                .map((documentItem) => InkWell(
                                      onTap: () {
                                        documentBloc.add(
                                            SelectAssociatedDocumentEvent(
                                                documentPicker: documentPicker,
                                                documentItem: documentItem));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(documentItem.label),
                                      ),
                                    ))
                                .toList(),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (documentPicker.associated != null) ...[
              ExpandableNotifier(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: CustomTheme.greyColor,
                  ),
                  child: Column(
                    children: <Widget>[
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 0.0),
                            child: SearchTextFieldUnderlined(
                              controller: documentPicker.search,
                              hintText:
                                  "Nom du ${documentPicker.associated!.label}",
                              onChanged: (v) {
                                documentBloc.add(SearchAssociateEvent(
                                    documentAssociate:
                                        documentPicker.associated!.type ==
                                                "Conducteur"
                                            ? DocumentAssociate.driver
                                            : documentPicker.associated!.type ==
                                                    "Client"
                                                ? DocumentAssociate.customer
                                                : DocumentAssociate.vehicle,
                                    keyWord:
                                        documentPicker.search?.text ?? ""));
                              },
                            ),
                          ),
                          collapsed: const SizedBox.shrink(),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              if (state.status == Status.loading) ...[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgress(),
                                ),
                              ] else if (state
                                  is SearchAssociateSuccessState) ...[
                                if (state.result.isEmpty)
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Aucun data trouvé"),
                                  )
                                else
                                  ...state.result
                                      .map((documentItem) =>
                                          RadioListTile<String>(
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            value: documentItem.label,
                                            onChanged: (v) {
                                              documentBloc.add(
                                                  SelectAssociatedIdDocumentEvent(
                                                      result: state.result,
                                                      documentPicker:
                                                          documentPicker,
                                                      documentItem:
                                                          documentItem));
                                            },
                                            title: Text(documentItem.label),
                                            groupValue: documentPicker
                                                .associatedSelectedName,
                                          ))
                                      .toList()
                              ]
                            ],
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                    crossFadePoint: 0),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
            const Divider(),
          ],
        );
      },
    );
  }
}
