import 'package:coursaty/Core/Constants/constants.dart';
import 'package:coursaty/Core/Shared_Widgets/app_bar_custom.dart';
import 'package:coursaty/Core/Shared_Widgets/dialogs/show_grade_dialog.dart';
import 'package:coursaty/Core/Shared_Widgets/main_button_custom.dart';
import 'package:coursaty/Core/Themes/color_data.dart';
import 'package:coursaty/Core/locale_keys.g.dart';
import 'package:coursaty/features/user/prsentation/manager/user_cubit.dart';
import 'package:coursaty/features/user/prsentation/manager/user_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Shared_Widgets/dialogs/show_cheating_dialog.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key, required this.courseId, required this.studentId});
  final String courseId;
  final String studentId;

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> with WidgetsBindingObserver {
  late UserCubit cubit;

  List<int?> selectedAnswers = List.filled(5, null);

  // Correct answers (index-based)
  final List<int> correctAnswers = [1, 2, 1, 0, 0];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    cubit = context.read<UserCubit>();
    cubit.initializeFaceDetector();
    cubit.initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    cubit.closeCamera();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isCheating = cubit.handleAppExit(state);

    if (isCheating) {
      debugPrint("Student exited the app");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cubit.closeCamera();
        context.pop();
        return true;
      },
      child: SafeArea(
        bottom: true,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Constants.kToolBarHeight),
            child: AppBarCustom(
              title: LocaleKeys.kExam.tr(),
              isHome: false,
              onBackPressed: () {
                cubit.closeCamera();
                context.pop();
              },
            ),
          ),
          body: BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is StudentIsCheating) {
                debugPrint("Student is cheating");
                showCheatingDialog(
                  context: context,
                  courseId: widget.courseId,
                  studentId: widget.studentId,
                );
              }
            },
            builder: (context, state) {
              if (state is CameraLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CameraOpened ||
                  state is FaceDetected ||
                  state is FaceNotDetected) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: Constants.questions.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Constants.questions[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              ...List.generate(
                                Constants.answers[index].length,
                                (i) {
                                  return RadioListTile<int>(
                                    selectedTileColor:
                                        ColorData.primary500Color,
                                    fillColor: WidgetStatePropertyAll(
                                      ColorData.primary500Color,
                                    ),
                                    title: Text(Constants.answers[index][i]),
                                    value: i,
                                    groupValue: selectedAnswers[index],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedAnswers[index] = value;
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MainButtonCustom(
                        text: LocaleKeys.kSubmit.tr(),
                        color: ColorData.primary500Color,
                        onTap: () {
                          int score = cubit.getScore(
                            selectedAnswers: selectedAnswers,
                            correctAnswers: correctAnswers,
                          );
                          showGradeDialog(
                            context: context,
                            score: score,
                            enrollmentId: widget.courseId,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
