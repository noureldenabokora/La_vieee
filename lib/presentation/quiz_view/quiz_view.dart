import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit/app_cubit.dart';
import 'package:la_vie/cubit/app_states.dart';
import 'package:la_vie/data/models/quiz_model.dart';
import 'package:la_vie/presentation/quiz_view/result_view.dart';
import 'package:la_vie/presentation/resources/color_manager.dart';
import 'package:la_vie/presentation/resources/styles_manager.dart';
import 'package:la_vie/presentation/resources/values_manager.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  late PageController _controller;
  int _qusetionNumber = 1;
  int score = 1;
  bool _islocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, Appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(height: height * 0.1),
                Text(
                  'Question $_qusetionNumber / ${qusestions.length} ',
                  style: getRegularStyle(
                      color: ColorManger.primary, size: AppSize.s20),
                ),
                SizedBox(height: height * 0.05),
                Expanded(
                  //  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: PageView.builder(
                      itemCount: qusestions.length,
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final _question = qusestions[index];
                        return buildQusetions(_question);
                      },
                    ),
                  ),
                ),
                _islocked ? buildElvatedButton() : const SizedBox.shrink(),
                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildQusetions(Qusetions qusetion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          qusetion.text,
          style: getRegularStyle(color: ColorManger.black, size: AppSize.s18),
        ),
        Expanded(
            child: OptionsWidget(
          qusetion: qusetion,
          onClickOption: (option) {
            if (qusetion.isLocked) {
              return;
            } else {
              setState(() {
                qusetion.isLocked = true;
                qusetion.selectedOption = option;
              });
              _islocked = qusetion.isLocked;
              if (qusetion.selectedOption!.isCorrect) {
                score++;
              }
            }
          },
        )),
      ],
    );
  }

  ElevatedButton buildElvatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (_qusetionNumber < qusestions.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            _qusetionNumber++;
            _islocked = false;
          });
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ResultPage(score: score),
          ));
        }
      },
      child: Text(_qusetionNumber < qusestions.length ? 'Next' : 'Finsh'),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  final Qusetions qusetion;
  final ValueChanged<Option> onClickOption;
  const OptionsWidget({
    Key? key,
    required this.qusetion,
    required this.onClickOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: qusetion.options
          .map((Option) => bulidOptin(context, Option))
          .toList(),
    );
  }

  Widget bulidOptin(BuildContext context, Option Option) {
    final color = getColorForOption(Option, qusetion);
    return GestureDetector(
      onTap: () => onClickOption(Option),
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: color),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Option.text,
              style: getRegularStyle(
                color: ColorManger.black,
                size: AppSize.s14,
              ),
            ),
            getIconForOption(Option, qusetion)
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Qusetions qusetions) {
    final isSelected = option == qusetions.selectedOption;

    if (qusetions.isLocked) {
      if (isSelected) {
        return option.isCorrect ? ColorManger.primary : ColorManger.error;
      } else if (option.isCorrect) {
        return ColorManger.primary;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Qusetions qusetion) {
    final isSelected = option == qusetion.selectedOption;

    if (qusetion.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: ColorManger.primary)
            : Icon(
                Icons.cancel,
                color: ColorManger.error,
              );
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: ColorManger.primary);
      }
    }
    return const SizedBox.shrink();
  }
}

Widget buildAvilablePlanItem(
  String title,
//  String moneyForMonth,
//  String time,
  bool selecetd,
  AppCubit cubit,
  context,
  bool valueone,
  void Function(bool value) month,
  // bool valuetwo,
  // void Function(bool value) days,
  // bool valueThree,
  // void Function(bool value) grab,
  // BoxConstraints constraints,
) =>
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            //       height: constraints.maxHeight * 0.25,
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: selecetd
                    ? ColorManger.primary.withOpacity(0.3)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: ColorManger.primary)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'The user experience is how the developer feels about a user.',
                    style: getRegularStyle(
                        color: ColorManger.black, size: AppSize.s16),
                  ),
                ),
                SizedBox(
                  height: 24,
                  width: 30,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: const Color(0xffC8C8D5),
                    ),
                    child: Checkbox(
                      value: valueone, // cubit.monthsPlanone,
                      onChanged: (v) {
                        month(v!);
                        //   /ss,cubit.monthsPlanOneCheckBox(v!);
                      },
                      checkColor: Colors.white,
                      activeColor: ColorManger.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
