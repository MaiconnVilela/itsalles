import '/backend/api_requests/api_calls.dart';
import '/biblia/versiculos/versiculos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'capitulos_model.dart';
export 'capitulos_model.dart';

class CapitulosWidget extends StatefulWidget {
  const CapitulosWidget({
    super.key,
    this.getBooksShortName,
  });

  final String? getBooksShortName;

  @override
  State<CapitulosWidget> createState() => _CapitulosWidgetState();
}

class _CapitulosWidgetState extends State<CapitulosWidget> {
  late CapitulosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CapitulosModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF0E1114),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 6.0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF12161A),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Capítulos',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: BibleForUApiGroup.listofChaptersCall.call(
                        versionsShortName: FFAppState().getVersionsShortNameVar,
                        booksShortName: widget!.getBooksShortName,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xF09C9C9C),
                                ),
                              ),
                            ),
                          );
                        }
                        final chaptersGridViewListofChaptersResponse =
                            snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final chapterItems = getJsonField(
                              chaptersGridViewListofChaptersResponse.jsonBody,
                              r'''$.data.chapters[:]''',
                            ).toList();

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: chapterItems.length,
                              itemBuilder: (context, chapterItemsIndex) {
                                final chapterItemsItem =
                                    chapterItems[chapterItemsIndex];
                                return FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.9,
                                              child: VersiculosWidget(
                                                getBooksShortName:
                                                    widget!.getBooksShortName,
                                                chaptersNum: getJsonField(
                                                  chapterItemsItem,
                                                  r'''$.ref''',
                                                ).toString(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: getJsonField(
                                    chapterItemsItem,
                                    r'''$.ref''',
                                  ).toString(),
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF1A1F24),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 4.0,
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                    hoverColor:
                                        FlutterFlowTheme.of(context).accent3,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
