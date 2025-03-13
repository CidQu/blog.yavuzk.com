import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'blog_icerigi_model.dart';
export 'blog_icerigi_model.dart';

class BlogIcerigiWidget extends StatefulWidget {
  const BlogIcerigiWidget({
    super.key,
    required this.blogNo,
  });

  final int? blogNo;

  @override
  State<BlogIcerigiWidget> createState() => _BlogIcerigiWidgetState();
}

class _BlogIcerigiWidgetState extends State<BlogIcerigiWidget> {
  late BlogIcerigiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogIcerigiModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 8.0,
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent4,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: StreamBuilder<List<BlogRecord>>(
                  stream: queryBlogRecord(
                    queryBuilder: (blogRecord) => blogRecord.where(
                      'blogNo',
                      isEqualTo: widget!.blogNo,
                    ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<BlogRecord> profileCardBlogRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final profileCardBlogRecord =
                        profileCardBlogRecordList.isNotEmpty
                            ? profileCardBlogRecordList.first
                            : null;

                    return Container(
                      constraints: BoxConstraints(
                        maxWidth: 700.0,
                        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'en'
                                                ? profileCardBlogRecord
                                                    ?.blogIsimEN
                                                : profileCardBlogRecord
                                                    ?.blogIsim,
                                            'Deneme',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Inter Tight',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 44.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: MarkdownBody(
                                data:
                                    FFLocalizations.of(context).languageCode ==
                                            'en'
                                        ? profileCardBlogRecord!.blogIceigiEN
                                        : profileCardBlogRecord!.blogIcerigi,
                                selectable: true,
                                onTapLink: (_, url, __) => launchURL(url!),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '37nsk6ph' /* Go Back */,
                                    ),
                                    options: FFButtonOptions(
                                      padding: EdgeInsets.all(24.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  if (!(currentUserDocument?.begenilenIcerikler
                                              ?.toList() ??
                                          [])
                                      .contains(widget!.blogNo))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            Function() _navigate = () {};
                                            if (loggedIn) {
                                              await profileCardBlogRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'likeSayisi':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'begenilenIcerikler':
                                                        FieldValue.arrayUnion(
                                                            [widget!.blogNo]),
                                                  },
                                                ),
                                              });
                                            } else {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              final user = await authManager
                                                  .signInAnonymously(context);
                                              if (user == null) {
                                                return;
                                              }
                                              _navigate = () =>
                                                  context.goNamedAuth(
                                                      HomePageWidget.routeName,
                                                      context.mounted);

                                              await profileCardBlogRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'likeSayisi':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'begenilenIcerikler':
                                                        FieldValue.arrayUnion(
                                                            [widget!.blogNo]),
                                                  },
                                                ),
                                              });
                                            }

                                            _navigate();
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'dad61mju' /* Like */,
                                          ),
                                          options: FFButtonOptions(
                                            padding: EdgeInsets.all(24.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 1.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
