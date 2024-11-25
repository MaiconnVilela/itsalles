import '/backend/api_requests/api_calls.dart';
import '/biblia/capitulos/capitulos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'livros_model.dart';
export 'livros_model.dart';

class LivrosWidget extends StatefulWidget {
  const LivrosWidget({
    super.key,
    this.getVersionsShortName,
  });

  final String? getVersionsShortName;

  @override
  State<LivrosWidget> createState() => _LivrosWidgetState();
}

class _LivrosWidgetState extends State<LivrosWidget> {
  late LivrosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LivrosModel());
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
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    'Livros',
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
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FutureBuilder<ApiCallResponse>(
                      future: BibleForUApiGroup.listOfBooksCall.call(
                        versionsShortName: FFAppState().getVersionsShortNameVar,
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
                        final listViewListOfBooksResponse = snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final bookItems = getJsonField(
                              listViewListOfBooksResponse.jsonBody,
                              r'''$.data.books[:]''',
                            ).toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: bookItems.length,
                              itemBuilder: (context, bookItemsIndex) {
                                final bookItemsItem = bookItems[bookItemsIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
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
                                              child: CapitulosWidget(
                                                getBooksShortName: getJsonField(
                                                  bookItemsItem,
                                                  r'''$.ref''',
                                                ).toString(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF12161A),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFB9B4EF),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                bookItemsIndex.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                bookItemsItem,
                                                r'''$.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
