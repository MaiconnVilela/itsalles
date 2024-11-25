import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'versiculos_model.dart';
export 'versiculos_model.dart';

class VersiculosWidget extends StatefulWidget {
  const VersiculosWidget({
    super.key,
    this.getBooksShortName,
    this.chaptersNum,
  });

  final String? getBooksShortName;
  final String? chaptersNum;

  @override
  State<VersiculosWidget> createState() => _VersiculosWidgetState();
}

class _VersiculosWidgetState extends State<VersiculosWidget> {
  late VersiculosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VersiculosModel());
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
                    'Versículos',
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
                      future: BibleForUApiGroup.listOfVersesCall.call(
                        versionShortName: FFAppState().getVersionsShortNameVar,
                        booksShortName: widget!.getBooksShortName,
                        chaptersNum: widget!.chaptersNum,
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
                        final chaptersGridViewListOfVersesResponse =
                            snapshot.data!;

                        return Builder(
                          builder: (context) {
                            final verseItems = getJsonField(
                              chaptersGridViewListOfVersesResponse.jsonBody,
                              r'''$.data.verses[:]''',
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
                              itemCount: verseItems.length,
                              itemBuilder: (context, verseItemsIndex) {
                                final verseItemsItem =
                                    verseItems[verseItemsIndex];
                                return FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'Biblia',
                                      queryParameters: {
                                        'getBooksShortName': serializeParam(
                                          widget!.getBooksShortName,
                                          ParamType.String,
                                        ),
                                        'getChaptersNumbers': serializeParam(
                                          widget!.chaptersNum,
                                          ParamType.String,
                                        ),
                                        'getVersesNumbers': serializeParam(
                                          getJsonField(
                                            verseItemsItem,
                                            r'''$.ref''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: getJsonField(
                                    verseItemsItem,
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
